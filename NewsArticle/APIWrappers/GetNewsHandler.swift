//
//  GetNewsHandler.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit
import RxSwift

final class GetNewsHandler: GetNewsHandlerProtocol {
    private let url = URL.topHeadlinesUrl()!
    private let defaultParam: [String: String] = ["country": ApiKey.countryGB,
                                                  "category": ApiKey.categorySports]
    private var resource: Resource<ArticlesList>!
    private let webService: WebServiceProtocol!

    init(withWebService webService: WebServiceProtocol = WebService()) {
        self.webService = webService
    }

    func getTopHeadlines(withParameter param: [String: String]?) -> Observable<ArticlesList?> {
        var parameter = ["apiKey": ApiKey.appId]
        parameter.merge(param ?? defaultParam) { (current, _) -> String in
            current
        }

        self.resource = Resource(url: url, parameter: parameter)

        return self.webService.load(resource: resource)
            .map { article -> ArticlesList? in
                return article
            }.asObservable()
            .retry(2)
    }

}

//    var resource1: Resource<ArticlesList> = {
//        let url = URL.topHeadlinesUrl()!
//        var param: [String: String] = ["country": ApiKey.countryGB,
//                                       "category": ApiKey.categorySports,
//                                    "apiKey": ApiKey.appId]
//        return Resource(url: url, parameter: param)
//    }()
