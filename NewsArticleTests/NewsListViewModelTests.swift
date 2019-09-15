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
//swiftlint:disable function_body_length
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
                    when(stub.getTopHeadlines(withParameter: any())).thenReturn(Observable.empty())
                })
                testViewModel = NewsListViewModel(withGetNews: mockGetNewsHandler)
            }

            describe("Get news from server", {

                context("when get news succeed ", {
                    beforeEach {
                        stub(mockGetNewsHandler, block: { stub in
                            when(stub.getTopHeadlines(withParameter: any())).thenReturn(Observable.just(mockArtcile))
                        })
                    }
                    it("it completed successfully", closure: {
                        verify(mockGetNewsHandler).getTopHeadlines(withParameter: any())
                    })
                    it("emits the news list to the UI for getTopHeadlines", closure: {
                        testScheduler.scheduleAt(300, action: {
                            testViewModel.getTopHeadlines(withParameter: nil)
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
                    it("emits the news list to the UI for updateNews withCategory", closure: {
                        testScheduler.scheduleAt(300, action: {
                            testViewModel.updateNews(withCategory: "MockCategory")
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
                    it("emits the news list to the UI for updateNews withSource", closure: {
                        testScheduler.scheduleAt(300, action: {
                            testViewModel.updateNews(withCategory: "MockSource")
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
                            when(stub.getTopHeadlines(withParameter: any())).thenReturn(Observable.error(mockError))
                        })
                    }
                    it("it completed successfully", closure: {
                        verify(mockGetNewsHandler).getTopHeadlines(withParameter: any())
                    })
                    it("emits the news list to the UI", closure: {
                        testScheduler.scheduleAt(300, action: {
                            testViewModel.getTopHeadlines(withParameter: nil)
                        })
                        let res = testScheduler.start { testViewModel.newsList.asObservable() }
                        expect(res.events).toNot(beNil())
                        expect(res.events.count).to(equal(1))
                        let correctResult = [Recorded.error(300, mockError, [NewsModel].self)]
                        expect(res.events).to(equal(correctResult))
                    })
                })
            })

            describe("When get route", {
                var buttonTapInput: Observable<Void>!
                var buttonNotTapInput: Observable<Void>!
                var didSelectRow: Observable<NewsModel>!

                beforeEach {
                    buttonTapInput = testScheduler.createColdObservable([Recorded.next(300, ())]).asObservable()
                    buttonNotTapInput = testScheduler.createColdObservable([]).asObservable()
                    didSelectRow = testScheduler.createColdObservable([]).asObservable()
                }

                context("when button categories is tapped", {

                    it("emits categories DashboardRoute to UI", closure: {
                        testViewModel.getRoute(withCategoriesButtonTap: buttonTapInput,
                                               withSourcesButtonTap: buttonNotTapInput,
                                               withNewsListdidSelectRow: didSelectRow)

                        let testObservable =  testViewModel.isDone
                        let res = testScheduler.start { testObservable }

                        expect(res.events.count).to(equal(1))
                        let correctResult = [Recorded.next(300, DashboardRoute.categories)]
                        expect(res.events).to(equal(correctResult))
                    })
                })

                context("when button Source is tapped", {
                    it("emits sources DashboardRoute to UI", closure: {
                        testViewModel.getRoute(withCategoriesButtonTap: buttonNotTapInput,
                                               withSourcesButtonTap: buttonTapInput,
                                               withNewsListdidSelectRow: didSelectRow)

                        let testObservable =  testViewModel.isDone
                        let res = testScheduler.start { testObservable }

                        expect(res.events.count).to(equal(1))
                        let correctResult = [Recorded.next(300, DashboardRoute.sources)]
                        expect(res.events).to(equal(correctResult))
                    })
                })

                context("When news list didSelectRow", {
                    var mockSelectedNews: NewsModel!

                    beforeEach {
                        if let selectedModel = MockData().stubArticlesList()?.articles[0] {
                            mockSelectedNews = selectedModel
                            didSelectRow = testScheduler.createColdObservable([Recorded.next(300, mockSelectedNews)]).asObservable()
                        } else {
                            XCTAssert(false, "nil mock value")
                        }
                    }

                    it("emits detail DashboardRoute to UI", closure: {
                        testViewModel.getRoute(withCategoriesButtonTap: buttonNotTapInput,
                                               withSourcesButtonTap: buttonNotTapInput,
                                               withNewsListdidSelectRow: didSelectRow)

                        let testObservable =  testViewModel.isDone
                        let res = testScheduler.start { testObservable }

                        expect(res.events.count).to(equal(1))
                        let correctResult = [Recorded.next(300, DashboardRoute.detail(selectedNews: mockSelectedNews))]
                        expect(res.events).to(equal(correctResult))
                    })
                })
            })
        }
    }
}
