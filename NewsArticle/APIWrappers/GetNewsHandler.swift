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
    private let url = URL.topHeadlinesUrl()!
    private var param: [String: String] = ["country": ApiKey.countryGB,
                                   "category": ApiKey.categorySports,
                                   "apiKey": ApiKey.appId]
    private var resource: Resource<ArticlesList>!

    init() {
        self.resource = Resource(url: url, parameter: param)
    }

    func populateNews(withCategory category: String = ApiKey.categorySports) -> Observable<ArticlesList?> {
        resource.parameter?.updateValue(category, forKey: "category")

        return URLRequest.load(resource: resource)
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
