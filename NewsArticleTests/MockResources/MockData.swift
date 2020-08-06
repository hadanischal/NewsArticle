//
//  MockData.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 21/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import Foundation
import XCTest
@testable import NewsArticle

class MockData {
    func stubNewsResult() -> NewsResult? {
        guard let data = self.readJson(forResource: "MockNewsList") else {
            XCTAssert(false, "Can't get data from MockNewsList.json")
            return nil
        }

        let decoder = JSONDecoder()
        if let result = try? decoder.decode(NewsResult.self, from: data) {
            return result
        } else {
            XCTAssert(false, "Unable to parse NewsResult results")
            return nil
        }
    }

    func stubSourceListModel() -> SourceListModel? {
        guard let data = self.readJson(forResource: "sources") else {
            XCTAssert(false, "Can't get data from sources.json")
            return nil
        }

        let decoder = JSONDecoder()
        if let result = try? decoder.decode(SourceListModel.self, from: data) {
            return result
        } else {
            XCTAssert(false, "Unable to parse SourceListModel results")
            return nil
        }
    }

    func stubEndpointsModel() -> EndpointsModel? {
        guard let data = self.readJson(forResource: "MockEndpoints") else {
            XCTAssert(false, "Can't get data from MockEndpoints.json")
            return nil
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let result = try? decoder.decode(EndpointsModel.self, from: data) {
            return result
        } else {
            XCTAssert(false, "Unable to parse MockEndpoints results")
            return nil
        }
    }

    func readJson(forResource fileName: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing file: \(fileName).json")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch _ {
            XCTFail("unable to read json")
            return nil
        }
    }
}
