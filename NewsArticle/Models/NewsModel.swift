//
//  NewsModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/10/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

struct NewsModelList: Decodable {
    let articles: [NewsModel]
}

struct NewsModel: Decodable {
    let title: String
    let description: String
}
