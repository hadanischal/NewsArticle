//
//  GetNewsHandlerTests.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 27/8/19.
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

class GetNewsHandlerTests: QuickSpec {

    override func spec() {
        var testHandler: GetNewsHandler!
        var mockWebService: MockWebServiceProtocol!
        var testScheduler: TestScheduler!
        let mockArticlesList = MockData().stubArticlesList()

        describe("GetNewsHandler") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)
                mockWebService = MockWebServiceProtocol()

                stub(mockWebService, block: { stub in
                    when(stub.load(resource: any(Resource<ArticlesList>.self))).thenReturn(Observable.empty())
                })
                testHandler = GetNewsHandler(withWebService: mockWebService)
            }

            describe("Get news info on initialization", {
                context("when getTopHeadlines succeed ", {
                    beforeEach {
                        stub(mockWebService, block: { stub in
                            when(stub.load(resource: any(Resource<ArticlesList>.self))).thenReturn(Observable.just(mockArticlesList!))
                        })
                    }
                    it("it completed successfully", closure: {
                        _ = testHandler.getTopHeadlines(withParameter: nil)
                        verify(mockWebService).load(resource: any(Resource<ArticlesList>.self))
                    })
                    it("emits the news list to the UI", closure: {
                        let observable = testHandler.getTopHeadlines(withParameter: nil).asObservable()

                        let res = testScheduler.start { observable }
                        expect(res.events.count).to(equal(2))
                        let correctResult = [Recorded.next(200, mockArticlesList),
                                             Recorded.completed(200)]
                        expect(res.events).to(equal(correctResult))
                    })
                })

                context("when get news failed ", {

                    beforeEach {
                        stub(mockWebService, block: { stub in
                            when(stub.load(resource: any(Resource<ArticlesList>.self))).thenReturn(Observable.error(mockError))
                        })
                    }
                    it("it completed successfully", closure: {
                        _ = testHandler.getTopHeadlines(withParameter: nil).asObservable()
                        verify(mockWebService).load(resource: any(Resource<ArticlesList>.self))
                    })
                    it("emits the news list to the UI", closure: {
                        let observable = testHandler.getTopHeadlines(withParameter: nil).asObservable()

                        let res = testScheduler.start { observable }
                        expect(res.events.count).to(equal(1))
                        let correctResult: [Recorded<Event<ArticlesList?>>] = [Recorded.error(200, mockError, ArticlesList?.self) ]
                        expect(res.events).to(equal(correctResult))
                    })
                })
            })

        }
    }
}
