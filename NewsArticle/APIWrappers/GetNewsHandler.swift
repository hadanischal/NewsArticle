//
//  GetNewsHandler.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit
import RxSwift

class GetNewsHandler: GetNewsHandlerProtocol {
    init() {}

    var resource: Resource<ArticlesList> = {
        let url = URL.topHeadlinesUrl()!
        let param: [String: String] = ["country": ApiKey.countryGB,
                                       "category": ApiKey.categorySports,
                                    "apiKey": ApiKey.appId]
        return Resource(url: url, parameter: param)
    }()

    func populateNews() -> Observable<ArticlesList?> {
        return URLRequest.load(resource: resource)
            .map { article -> ArticlesList? in
                return article
            }.asObservable()
            .retry(2)
    }

}
