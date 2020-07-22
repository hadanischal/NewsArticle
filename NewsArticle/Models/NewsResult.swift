//
//  NewsResult.swift
//  NewsArticle
//
//  Created by Nischal Hada on 22/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import Foundation

// MARK: - NewsResult

struct NewsResult: Decodable, Equatable {
    let articles: [NewsModel]
    let totalResults: Int?
}

// MARK: - NewsModel

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

// MARK: - Source

struct SourceModel: Codable, Equatable {
    let id: String?
    let name: String?
    let description: String?
    let url: String?
    let category: String?
    let language: String?
    let country: String?
}
