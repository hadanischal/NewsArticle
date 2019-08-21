//
//  ArticlesList.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/10/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

struct ArticlesList: Decodable {
    let articles: [NewsModel]
    let totalResults: Int?
}

//extension ArticlesList {
//    //let resource = Resource<ArticlesList>(url: url)
//    static var resource: Resource<ArticlesList> = {
//        let url = URL.topHeadlinesUrl()!
//        return Resource(url: url, parameter: nil)
//    }()
//}
