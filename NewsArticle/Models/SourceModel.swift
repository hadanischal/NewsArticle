//
//  SourceModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 21/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

struct SourceModel: Codable {
    let id: String?
    let name: String?
    let description: String?
    let url: String?
    let category: String?
    let language: String?
    let country: String?
}
