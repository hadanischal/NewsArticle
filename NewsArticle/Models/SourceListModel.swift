//
//  SourcesModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 31/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

struct SourceListModel: Decodable, Equatable {
    let sources: [SourceModel]?
    let status: String?
}

extension SourceListModel {
    static func == (lhs: SourceListModel, rhs: SourceListModel) -> Bool {
       return lhs.status == rhs.status && lhs.sources?.count == rhs.sources?.count
    }
}
