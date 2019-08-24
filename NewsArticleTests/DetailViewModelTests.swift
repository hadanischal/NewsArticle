//
//  DetailViewModelTests.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 23/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import XCTest
import Quick
import Nimble
import Cuckoo
import RxTest
import RxBlocking
import RxSwift

@testable import NewsArticle

class DetailViewModelTests: QuickSpec {

    override func spec() {
        var testViewModel: DetailViewModel!
        var testScheduler: TestScheduler!
        let mockArtcile = MockData().stubArticlesList()
        let mockNews = mockArtcile?.articles

        describe("DetailViewModel") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)
                let mockNewsValue = mockNews?[0]
                testViewModel = DetailViewModel(withNewsModel: mockNewsValue!)
            }

            describe("Get news info on initialization", {

                it("emits the news list to the UI", closure: {
                    let res = testScheduler.start { testViewModel.newsList }
                    expect(res.events.count).to(equal(2))
                    if let articles = mockNews {
                        let correctResult = [Recorded.next(200, articles),
                                             Recorded.completed(200)
                        ]
                        expect(res.events).to(equal(correctResult))
                    } else {
                        XCTAssert(false, "nil mock value")
                    }
                })

                it("emits the title to the UI", closure: {

                    let res = testScheduler.start { testViewModel.title }
                    expect(res.events.count).to(equal(2))
                    let correctResult = [Recorded.next(200, "Cheap smartwatch deals"),
                                         Recorded.completed(200)]
                    expect(res.events).to(equal(correctResult))
                })
            })
        }
    }
}
