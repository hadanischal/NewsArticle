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
}

extension ArticlesList {
    //let resource = Resource<ArticlesList>(url: url)
    static var resource: Resource<ArticlesList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=au&apiKey=\(ApiKey.appId)")!
        return Resource(url: url)
    }()

}

struct ApiKey {
    static let appId = "8fa8303737ca441d9417e52672307439"
}
