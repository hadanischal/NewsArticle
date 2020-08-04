//
//  SourcesDTO.swift
//  NewsArticle
//
//  Created by Nischal Hada on 22/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import Foundation

// MARK: - SourcesDTO

struct SourcesDTO: Equatable {
    let id: String
    let name: String
    let description: String
    let url: String?
    let category: String?
}

extension SourcesDTO {
    init(_ data: SourceModel) {
        self.id = data.id ?? ""
        self.name = data.name?.withoutHtml ?? ""
        self.description = data.description?.withoutHtml ?? ""
        self.url = data.url
        self.category = data.category
    }
}
