//
//  URL+Extensions.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/10/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

extension URL {
    static func topHeadlinesUrl() -> URL? {
        return URL(string: ApiConstant.baseServerURL + ApiConstant.topHeadlines)
        //(string: "https://newsapi.org/v2/top-headlines?country=au&apiKey=\(ApiKey.appId)")
    }
    static func selectedAPIUrl(withUrl url: String) -> URL? {
        return URL(string: ApiConstant.baseServerURL + url)
    }
    static func sourcesUrl() -> URL? {
        return URL(string: ApiConstant.baseServerURL + ApiConstant.getSources)
    }
}

struct ApiKey {
    static let appId = "8fa8303737ca441d9417e52672307439"
    static let country = "au"
    static let countryGB = "gb"
    static let categorySports = "sports"
    static let sources = "sources"
}

struct ApiConstant {
    static let baseServerURL = "https://newsapi.org"
    static let topHeadlines = "/v2/top-headlines"
    static let getSources = "/v2/sources"
}
//https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=API_KEY
