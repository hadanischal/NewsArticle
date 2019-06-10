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
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=0cf790498275413a9247f8b94b3843fd")!
        return Resource(url: url)
    }()

}
