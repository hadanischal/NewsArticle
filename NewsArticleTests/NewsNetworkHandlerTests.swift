//
//  NewsNetworkHandlerTests.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 20/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import Cuckoo
import Nimble
import Quick
import RxSwift
import RxTest
import XCTest

@testable import NewsArticle

final class NewsNetworkHandlerTests: QuickSpec {
    override func spec() {
        var testNetworkHandler: NewsNetworkHandler!
        var mockWebService: MockWebServiceProtocol!
        var testScheduler: TestScheduler!

        describe("NewsNetworkHandlerTests test") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)
                mockWebService = MockWebServiceProtocol()
                stub(mockWebService) { stub in
                    when(stub.load(resource: any())).thenReturn(Observable<NewsResult?>.error(mockError))
                }
                testNetworkHandler = NewsNetworkHandler(withWebService: mockWebService)
            }

            describe("getTopHeadlines test") {
                let mockNewsResult = MockData().stubNewsResult()

                context("when getTopHeadlines succeed ", {
                    beforeEach {
                        stub(mockWebService, block: { stub in
                            when(stub.load(resource: any(Resource<NewsResult>.self))).thenReturn(Observable.just(mockNewsResult!))
                        })
                    }
                    it("it completed successfully", closure: {
                        _ = testNetworkHandler.getTopHeadlines(nil)
                        verify(mockWebService).load(resource: any(Resource<NewsResult>.self))
                    })
                    it("emits the news list to the UI", closure: {
                        let observable = testNetworkHandler.getTopHeadlines(nil).asObservable()

                        let res = testScheduler.start { observable }
                        expect(res.events.count).to(equal(2))
                        let correctResult = [Recorded.next(200, mockNewsResult!.articles),
                                             Recorded.completed(200)]
                        expect(res.events).to(equal(correctResult))
                    })
                })

                context("when get news failed ") {
                    beforeEach {
                        stub(mockWebService, block: { stub in
                            when(stub.load(resource: any(Resource<NewsResult>.self))).thenReturn(Observable.error(mockError))
                        })
                    }
                    it("it completed successfully", closure: {
                        _ = testNetworkHandler.getTopHeadlines(nil).asObservable()
                        verify(mockWebService).load(resource: any(Resource<NewsResult>.self))
                    })
                    it("emits the news list to the UI", closure: {
                        let observable = testNetworkHandler.getTopHeadlines(nil).asObservable()

                        let res = testScheduler.start { observable }
                        expect(res.events.count).to(equal(1))
                        let correctResult: [Recorded<Event<[NewsModel]>>] = [Recorded.error(200, mockError)]
                        expect(res.events).to(equal(correctResult))
                    })
                }
            }

            describe("getSources Test") {
                let mockSourceResult: SourceListModel! = MockData().stubSourceListModel()!

                context("when getSources succeed ", {
                    beforeEach {
                        stub(mockWebService, block: { stub in
                            when(stub.load(resource: any(Resource<SourceListModel>.self))).thenReturn(Observable.just(mockSourceResult))
                        })
                    }
                    it("it completed successfully", closure: {
                        _ = testNetworkHandler.getSources()
                        verify(mockWebService).load(resource: any(Resource<SourceListModel>.self))
                    })
                    it("emits the news list to the UI", closure: {
                        let observable = testNetworkHandler.getSources().asObservable()

                        let res = testScheduler.start { observable }
                        expect(res.events.count).to(equal(2))
                        let correctResult = [Recorded.next(200, mockSourceResult!.sources!),
                                             Recorded.completed(200)]
                        expect(res.events).to(equal(correctResult))
                    })
                })

                context("when getSources failed ") {
                    beforeEach {
                        stub(mockWebService, block: { stub in
                            when(stub.load(resource: any(Resource<SourceListModel>.self))).thenReturn(Observable.error(mockError))
                        })
                    }
                    it("it completed successfully", closure: {
                        _ = testNetworkHandler.getSources()
                        verify(mockWebService).load(resource: any(Resource<SourceListModel>.self))
                    })
                    it("emits the news list to the UI", closure: {
                        let observable = testNetworkHandler.getSources().asObservable()

                        let res = testScheduler.start { observable }
                        expect(res.events.count).to(equal(1))
                        let correctResult: [Recorded<Event<[SourceModel]>>] = [Recorded.error(200, mockError)]
                        expect(res.events).to(equal(correctResult))
                    })
                }
            }
        }
    }
}
