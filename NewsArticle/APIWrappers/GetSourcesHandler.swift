//
//  GetSourcesHandler.swift
//  NewsArticle
//
//  Created by Nischal Hada on 31/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import RxSwift

class GetSourcesHandler: GetSourcesHandlerProtocol {
    var resource: Resource<SourceListModel> = {
        let url = URL.sourcesUrl()!
        var param: [String: String] = ["apiKey": ApiKey.appId]
        return Resource(url: url, parameter: param)
    }()

    private let webService: WebServiceProtocol!

    init(withWebService webService: WebServiceProtocol = WebService()) {
        self.webService = webService
    }

    func getSources() -> Observable<SourceListModel?> {
        return self.webService.load(resource: resource)
            .map { list-> SourceListModel? in
                return list
            }.asObservable()
            .retry(2)
    }
}
