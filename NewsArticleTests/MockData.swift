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

        guard let data = self.dataForResource(withName: "MockNewsList") else {
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

        guard let data = self.dataForResource(withName: "sources") else {
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

     func dataForResource(withName fileName: String, ofType fileType: String = ".json") -> Data? {
        let bundle = Bundle(for: type(of: self))
        do {
            if let url = bundle.url(forResource: fileName, withExtension: fileType) {
                let data = try Data(contentsOf: url)
                return data
            }
        } catch {
            XCTFail("unable to read json")
            print("Unable to load resource \(fileName).\(fileType): \(error)")
        }
        return nil
    }

}
