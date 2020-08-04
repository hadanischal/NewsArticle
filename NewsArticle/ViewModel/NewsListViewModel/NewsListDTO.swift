//
//  NewsListModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 22/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import Foundation

// MARK: - NewsListDTO

struct NewsListDTO: Decodable, Equatable {
    let title: String
    let description: String
    let url: String
    let urlToImage: String

    init(_ data: NewsModel) {
        title = data.title?.withoutHtml ?? ""
        description = data.description?.withoutHtml ?? ""
        url = data.url ?? ""
        urlToImage = data.urlToImage ?? ""
    }
}
