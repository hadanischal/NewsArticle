//
//  DetailViewModelTests.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 23/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Cuckoo
import Nimble
import Quick
import XCTest

@testable import NewsArticle

class DetailViewModelTests: QuickSpec {
    override func spec() {
        var testViewModel: DetailViewModel!
        let mockArtcile = MockData().stubNewsResult()
        let mockNews = mockArtcile?.articles
        let mockNewsValue: NewsListDTO = NewsListDTO(mockNews!.first!)

        describe("DetailViewModel Test") {
            beforeEach {
                testViewModel = DetailViewModel(withNewsModel: mockNewsValue)
            }

            it("sets the title correctly") {
                expect(testViewModel.title).to(equal(mockNewsValue.title))
            }

            it("sets the numberOfRowsInSection correctly") {
                expect(testViewModel.numberOfRowsInSection).to(equal(1))
            }

            it("sets the numberOfRowsInSection correctly") {
                expect(testViewModel.infoForRowAt(0)).to(equal(mockNewsValue))
            }
        }
    }
}
