//
//  NewsListViewModelTests.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 20/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//
// swiftlint:disable force_cast

import Cuckoo
import Nimble
import Quick
import RxBlocking
import RxSwift
import RxTest
import XCTest

@testable import NewsArticle

class NewsListViewModelTests: QuickSpec {
    override func spec() {
        var testViewModel: NewsListViewModel!
        var mockGetNewsHandler: MockNewsListNetworkHandling!
        var testScheduler: TestScheduler!
        let mockArtcile = MockData().stubNewsResult()
        let mockNews: [NewsModel]! = mockArtcile?.articles

        describe("NewsListViewModel Test") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)
                mockGetNewsHandler = MockNewsListNetworkHandling()
                stub(mockGetNewsHandler, block: { stub in
                    when(stub.getTopHeadlines(any())).thenReturn(Observable.empty())
                })
                testViewModel = NewsListViewModel(withNetworkHandling: mockGetNewsHandler)
            }

            describe("Get news from server") {
                context("when get news succeed ") {
                    beforeEach {
                        stub(mockGetNewsHandler, block: { stub in
                            when(stub.getTopHeadlines(any())).thenReturn(Observable.just(mockNews))
                        })
                        testScheduler.scheduleAt(300) {
                            testViewModel.viewDidLoad()
                        }
                        testViewModel.viewDidLoad()
                    }

                    it("it completed successfully", closure: {
                        verify(mockGetNewsHandler).getTopHeadlines(any())
                    })

                    it("emits the updateInfo to the UI") {
                        let observable = testViewModel.updateInfo.asObservable()
                        let res = testScheduler.start { observable }
                        expect(res.events.count).to(equal(1))
                        let correctResult = [Recorded.next(300, true)]
                        expect(res.events).to(equal(correctResult))
                    }

                    it("wont emits the errorResult to the UI") {
                        let res = testScheduler.start { testViewModel.errorResult }
                        expect(res.events).toNot(beNil())
                        expect(res.events.count).to(equal(0))
                    }

                    it("emits the isLoading to the UI") {
                        let res = testScheduler.start { testViewModel.isLoading }
                        expect(res.events.count).to(equal(2))
                        let correctResult = [Recorded.next(200, false), Recorded.next(300, false)]
                        expect(res.events).to(equal(correctResult))
                    }
                }

                context("when get news failed ") {
                    beforeEach {
                        stub(mockGetNewsHandler, block: { stub in
                            when(stub.getTopHeadlines(any())).thenReturn(Observable.error(mockError))
                        })
                        testScheduler.scheduleAt(300) {
                            testViewModel.viewDidLoad()
                        }
                        testViewModel.viewDidLoad()
                    }
                    it("it completed successfully", closure: {
                        verify(mockGetNewsHandler).getTopHeadlines(any())
                    })
                    it("it sets numberOfRowsInSection correctly") {
                        expect(testViewModel.numberOfRowsInSection).to(equal(0))
                    }
                    it("doesnt emits updateInfo to the UI") {
                        let observable = testViewModel.updateInfo.asObservable()
                        let res = testScheduler.start { observable }
                        expect(res.events).toNot(beNil())
                        expect(res.events.count).to(equal(0))
                    }
                    it("emits the errorResult to the UI") {
                        let res = testScheduler.start { testViewModel.errorResult.map { $0 as! MockError } }
                        expect(res.events).toNot(beNil())
                        expect(res.events.count).to(equal(1))

                        let correctResult = [Recorded.next(300, mockError)]
                        expect(res.events).to(equal(correctResult))
                    }

                    it("emits the isLoading to the UI") {
                        let res = testScheduler.start { testViewModel.isLoading }
                        expect(res.events.count).to(equal(2))
                        let correctResult = [Recorded.next(200, false), Recorded.next(300, false)]
                        expect(res.events).to(equal(correctResult))
                    }
                }
            }
            context("Get NewsListModel for index") {
                var mockResponse: [NewsListDTO]!
                beforeEach {
                    stub(mockGetNewsHandler, block: { stub in
                        when(stub.getTopHeadlines(any())).thenReturn(Observable.just(mockNews))
                    })
                    mockResponse = mockNews.map { NewsListDTO($0) }
                    testViewModel.viewDidLoad()
                }

                it("it sets numberOfRowsInSection correctly") {
                    expect(testViewModel.numberOfRowsInSection).to(equal(1))
                }

                it("it sets NewsListDTO   correctly") {
                    for item in mockResponse.enumerated() {
                        let (index, correctResult) = item
                        expect(testViewModel.infoForRowAt(index)).to(equal(correctResult))
                    }
                }
            }

            context("Update news with SourcesDTO") {
                let mockSourcesDTO: SourcesDTO! = SourcesDTO((MockData().stubSourceListModel()!.sources?.first)!)

                beforeEach {
                    stub(mockGetNewsHandler, block: { stub in
                        when(stub.getTopHeadlines(any())).thenReturn(Observable.just(mockNews))
                    })
                    testScheduler.scheduleAt(300) {
                        testViewModel.updateNews(withSource: mockSourcesDTO)
                    }
                }

                it("emits the navigation title to the UI") {
                    let observable = testViewModel.title.asObservable()
                    let res = testScheduler.start { observable }
                    expect(res.events.count).to(equal(2))
                    let correctResult = [Recorded.next(200, "News"), Recorded.next(300, mockSourcesDTO.name)]
                    expect(res.events).to(equal(correctResult))
                }

                it("emits the updateInfo to the UI") {
                    let observable = testViewModel.updateInfo.asObservable()
                    let res = testScheduler.start { observable }
                    expect(res.events.count).to(equal(1))
                    let correctResult = [Recorded.next(300, true)]
                    expect(res.events).to(equal(correctResult))
                }

                it("wont emits the errorResult to the UI") {
                    let res = testScheduler.start { testViewModel.errorResult }
                    expect(res.events).toNot(beNil())
                    expect(res.events.count).to(equal(0))
                }

                it("emits the isLoading to the UI") {
                    let res = testScheduler.start { testViewModel.isLoading }
                    expect(res.events.count).to(equal(2))
                    let correctResult = [Recorded.next(200, true), Recorded.next(300, false)]
                    expect(res.events).to(equal(correctResult))
                }
            }

            context("Update news with category") {
                let mockCategory: String! = "Business"

                beforeEach {
                    stub(mockGetNewsHandler, block: { stub in
                        when(stub.getTopHeadlines(any())).thenReturn(Observable.just(mockNews))
                    })
                    testScheduler.scheduleAt(300) {
                        testViewModel.updateNews(withCategory: mockCategory)
                    }
                }

                it("emits the navigation title to the UI") {
                    let observable = testViewModel.title.asObservable()
                    let res = testScheduler.start { observable }
                    expect(res.events.count).to(equal(2))
                    let correctResult: [Recorded<Event<String>>] = [Recorded.next(200, "News"), Recorded.next(300, mockCategory)]
                    expect(res.events).to(equal(correctResult))
                }

                it("emits the updateInfo to the UI") {
                    let observable = testViewModel.updateInfo.asObservable()
                    let res = testScheduler.start { observable }
                    expect(res.events.count).to(equal(1))
                    let correctResult = [Recorded.next(300, true)]
                    expect(res.events).to(equal(correctResult))
                }

                it("wont emits the errorResult to the UI") {
                    let res = testScheduler.start { testViewModel.errorResult }
                    expect(res.events).toNot(beNil())
                    expect(res.events.count).to(equal(0))
                }

                it("emits the isLoading to the UI") {
                    let res = testScheduler.start { testViewModel.isLoading }
                    expect(res.events.count).to(equal(2))
                    let correctResult = [Recorded.next(200, true), Recorded.next(300, false)]
                    expect(res.events).to(equal(correctResult))
                }
            }
        }
    }
}
