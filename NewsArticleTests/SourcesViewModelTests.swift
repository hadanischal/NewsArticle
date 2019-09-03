//
//  SourcesViewModelTests.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 3/9/19.
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

class SourcesViewModelTests: QuickSpec {

    override func spec() {
        var testViewModel: SourcesViewModel!
        var mockGetSourcesHandler: MockGetSourcesHandlerProtocol!
        var testScheduler: TestScheduler!
        let mockSourceListModel = MockData().stubSourceListModel()

        describe("SourcesViewModel") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)
                mockGetSourcesHandler = MockGetSourcesHandlerProtocol()
                stub(mockGetSourcesHandler, block: { stub in
                    when(stub.getSources()).thenReturn(Observable.empty())
                })
                testViewModel = SourcesViewModel(withSourcesHandler: mockGetSourcesHandler)
            }

            describe("Get news info on initialization", {
                context("when get news succeed ", {
                    beforeEach {
                        stub(mockGetSourcesHandler, block: { stub in
                            when(stub.getSources()).thenReturn(Observable.just(mockSourceListModel))
                        })
                        testViewModel.getSources()
                    }
                    it("it completed successfully", closure: {
                        verify(mockGetSourcesHandler).getSources()
                    })
                    it("emits the news list to the UI", closure: {
                        testScheduler.scheduleAt(300, action: {
                            testViewModel.getSources()
                        })
                        let testObservable = testViewModel.newsList
                        let res = testScheduler.start { testObservable }
                        expect(res.events.count).to(equal(1))
                        if let sourceListModel = mockSourceListModel?.sources {
                            let correctResult = [Recorded.next(300, sourceListModel)]
                            expect(res.events).to(equal(correctResult))
                        } else {
                            XCTAssert(false, "nil mock value")
                        }

                    })
                })

                context("when get news failed ", {
                    beforeEach {
                        stub(mockGetSourcesHandler, block: { stub in
                            when(stub.getSources()).thenReturn(Observable.error(mockError))
                        })
                    }
                    it("it completed successfully", closure: {
                        testViewModel.getSources()
                        verify(mockGetSourcesHandler).getSources()
                    })
                    it("emits the news list to the UI", closure: {
                        testScheduler.scheduleAt(300, action: {
                            testViewModel.getSources()
                        })
                        let testObservable = testViewModel.newsList
                        let res = testScheduler.start { testObservable }
                        expect(res.events.count).to(equal(1))
                        let correctResult = [Recorded.error(300, mockError, [SourceModel].self)]
                        expect(res.events).to(equal(correctResult))
                    })
                })
            })
        }
    }
}
