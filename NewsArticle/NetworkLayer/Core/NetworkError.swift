//
//  NetworkError.swift
//  NewsArticle
//
//  Created by Nischal Hada on 20/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import Foundation

enum NetworkError: Error, Equatable {
    /// Unknown error occurred.
    case unknown
    /// Url is invalid error.
    case badURL
    /// Address entered is invalid error.
    case invalidLocation
    /// Address doesn't exist.
    case locationNotFound
    /// Timeout error.
    case timeout
    /// No Internet connection.
    case noInternetConnectivity
}

extension NetworkError: LocalizedError {
    /// A localized message describing what error occurred.
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "Server Error"
        case .badURL:
            return "Unauthorised reqest"
        case .invalidLocation:
            return "Invalid Location provided"
        case .locationNotFound:
            return "Location is not available."
        case .timeout:
            return "Request timeout"
        case .noInternetConnectivity:
            return "The Internet connection appears to be offline."
        }
    }
}
