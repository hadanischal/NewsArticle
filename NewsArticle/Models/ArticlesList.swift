//
//  ArticlesList.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/10/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

struct ArticlesList: Decodable, Equatable {
    let articles: [NewsModel]
    let totalResults: Int?
}
