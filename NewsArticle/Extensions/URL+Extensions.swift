//
//  URL+Extensions.swift
//  WeatherZone
//
//  Created by Nischal Hada on 6/10/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

extension URL {
    static func topHeadlinesUrl() -> URL? {
        return URL(string: "https://newsapi.org/v2/top-headlines?country=au&apiKey=\(ApiKey.appId)")
    }
}

struct ApiKey {
    static let appId = "8fa8303737ca441d9417e52672307439"
}

//struct ApiConstant {
//    static let baseServerURL = "https://newsapi.org/v2/"
//    static let topHeadlines = "top-headlines?country=au"
//    static let apiKey = "&apiKey=\(ApiKey.appId)"
//}
