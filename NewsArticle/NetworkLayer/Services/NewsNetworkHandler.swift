//
//  NewsNetworkHandler.swift
//  NewsArticle
//
//  Created by Nischal Hada on 20/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import Foundation
import RxSwift

protocol NewsListNetworkHandling {
    func getTopHeadlines(_ param: [String: String]?) -> Observable<[NewsModel]>
}

protocol NewsSourceNetworkHandling {
    func getSources() -> Observable<[SourceModel]>
}

typealias NewsNetworkHandling = NewsListNetworkHandling & NewsSourceNetworkHandling

final class NewsNetworkHandler: NewsNetworkHandling {
    private let defaultParam: [String: String] = [ApiKey.country: Environment.Variables.countryGB,
                                                  ApiKey.category: Environment.Variables.categorySports]
    private let webService: WebServiceProtocol

    init(withWebService webService: WebServiceProtocol = WebService()) {
        self.webService = webService
    }

    func getTopHeadlines(_ param: [String: String]?) -> Observable<[NewsModel]> {
        guard let url = URL.topHeadlinesUrl else { return Observable<[NewsModel]>.error(NetworkError.badURL) }
        let parameter = param ?? defaultParam

        let resource: Resource<NewsResult> = { Resource(url: url, parameter: parameter) }()

        return self.webService.load(resource: resource)
            .map { $0.articles }
            .asObservable()
            .retry(2)
    }

    func getSources() -> Observable<[SourceModel]> {
        guard let url = URL.sourcesUrl else { return Observable<[SourceModel]>.error(NetworkError.badURL) }

        let resource: Resource<SourceListModel> = { Resource(url: url) }()

        return self.webService.load(resource: resource)
            .compactMap { $0.sources }
            .retry(2)
    }
}
