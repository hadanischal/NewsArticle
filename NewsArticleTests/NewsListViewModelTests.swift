//
//  NewsListViewModelTests.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 20/8/19.
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

class NewsListViewModelTests: QuickSpec {

    override func spec() {
        var testViewModel: NewsListViewModel!
        var mockGetNewsHandler: MockGetNewsHandlerProtocol!
        var testScheduler: TestScheduler!
        let mockArtcile = MockData().stubArticlesList()
        let mockNews = mockArtcile?.articles

        describe("BaseViewModel") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)
                mockGetNewsHandler = MockGetNewsHandlerProtocol()
                stub(mockGetNewsHandler, block: { stub in
                    when(stub.populateNews()).thenReturn(Observable.empty())
                })
                testViewModel = NewsListViewModel(withGetNews: mockGetNewsHandler)
            }

            describe("Get news from server", {

                context("when get news succeed ", {
                    beforeEach {
                        stub(mockGetNewsHandler, block: { stub in
                            when(stub.populateNews()).thenReturn(Observable.just(mockArtcile))
                        })
                    }
                    it("it completed successfully", closure: {
                        verify(mockGetNewsHandler).populateNews()
                    })
                    it("emits the news list to the UI", closure: {
                        testScheduler.scheduleAt(300, action: {
                            testViewModel.populateNews()
                        })
                        let res = testScheduler.start { testViewModel.newsList.asObservable() }
                        expect(res.events.count).to(equal(1))
                        if let articles = mockNews {
                            let correctResult = [Recorded.next(300, articles)]
                            expect(res.events).to(equal(correctResult))
                        } else {
                            XCTAssert(false, "nil mock value")
                        }

                     })
                })

                context("when get news failed ", {
                    beforeEach {
                        stub(mockGetNewsHandler, block: { stub in
                            when(stub.populateNews()).thenReturn(Observable.error(RxError.noElements))
                        })
                    }
                    it("it completed successfully", closure: {
                        verify(mockGetNewsHandler).populateNews()
                    })
                    it("emits the news list to the UI", closure: {
                        testScheduler.scheduleAt(300, action: {
                            testViewModel.populateNews()
                        })
                        let res = testScheduler.start { testViewModel.newsList.asObservable() }
                        expect(res.events).toNot(beNil())
                        expect(res.events.count).to(equal(0))
                    })
                })
            })
        }
    }
}
