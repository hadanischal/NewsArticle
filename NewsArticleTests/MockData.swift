//
//  MockData.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 23/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import XCTest
@testable import NewsArticle

class MockData {

    func stubArticlesList() -> ArticlesList? {

        guard let data = self.readJson(forResource: "MockNewsList") else {
            XCTAssert(false, "Can't get data from MockNewsList.json")
            return nil
        }

        let decoder = JSONDecoder()
        if let result = try? decoder.decode(ArticlesList.self, from: data) {
            return result
        } else {
            XCTAssert(false, "Unable to parse ArticlesList results")
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
            XCTAssert(false, "Unable to parse ArticlesList results")
            return nil
        }
    }

    func readJson(forResource fileName: String ) -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing file: \(fileName).json")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch (_) {
            XCTFail("unable to read json")
            return nil
        }
    }

}
