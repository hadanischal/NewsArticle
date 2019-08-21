//
//  NewsModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/10/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

struct NewsModel: Decodable, Equatable {
    let source: SourceModel?
    let title: String?
    let description: String?
    let author: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

extension NewsModel {
    static func == (lhs: NewsModel, rhs: NewsModel) -> Bool {
      return lhs.title == rhs.title && lhs.description == rhs.description
    }
}
