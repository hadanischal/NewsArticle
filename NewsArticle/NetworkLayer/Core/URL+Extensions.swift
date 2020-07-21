//
//  URL+Extensions.swift
//  NewsArticle
//
//  Created by Nischal Hada on 20/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import Foundation

extension URL {
    static var topHeadlinesUrl: URL? { URL(string: ApiConstant.baseServerURL + ApiConstant.topHeadlines) }
    static func selectedAPIUrl(withUrl url: String) -> URL? { URL(string: ApiConstant.baseServerURL + url) }
    static var sourcesUrl: URL? { URL(string: ApiConstant.baseServerURL + ApiConstant.getSources) }
}

struct ApiKey {
    static let sources = "sources"
    static let apiKey = "apiKey"

    static let country = "country"
    static let category = "category"
}

struct Environment {
    struct Variables {
        static let appId = "8fa8303737ca441d9417e52672307439"
        static let country = "au"
        static let countryGB = "gb"
        static let categorySports = "sports"
    }
}

struct ApiConstant {
    static let baseServerURL = "https://newsapi.org"
    static let topHeadlines = "/v2/top-headlines"
    static let getSources = "/v2/sources"
}

// https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=API_KEY
// (string: "https://newsapi.org/v2/top-headlines?country=au&apiKey=\(ApiKey.appId)")
