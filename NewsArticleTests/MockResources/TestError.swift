//
//  TestError.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 21/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import Foundation

public enum MockError: Error, Equatable {
    /// Unknown error occurred.
    case unknown
    /// Aritmetic overflow error.
    case overflow
    /// Argument out of range error.
    case argumentOutOfRange
    /// Sequence doesn't contain any elements.
    case noElements
    /// Sequence contains more than one element.
    case moreThanOneElement
    /// Timeout error.
    case timeout
}

extension MockError {
    /// A textual representation of `self`, suitable for debugging.
    public var debugDescription: String {
        switch self {
        case .unknown:
            return "Unknown error occurred."
        case .overflow:
            return "Arithmetic overflow occurred."
        case .argumentOutOfRange:
            return "Argument out of range."
        case .noElements:
            return "Sequence doesn't contain any elements."
        case .moreThanOneElement:
            return "Sequence contains more than one element."
        case .timeout:
            return "Sequence timeout."
        }
    }
}

let mockError = MockError.unknown
