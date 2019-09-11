//
//  DashboardRoute.swift
//  NewsArticle
//
//  Created by Nischal Hada on 11/9/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

enum DashboardRoute {
    case newsList
    case detail
    case categories
    case sources
    case newsCategory(category: String)
    case newsSource(source: SourceModel)
}
