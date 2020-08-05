//
//  SourcesViewModelTests.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 3/9/19.
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

class SourcesViewModelTests: QuickSpec {
    override func spec() {
        var testViewModel: SourcesViewModel!
        var mockGetSourcesHandler: MockNewsSourceNetworkHandling!
        var testScheduler: TestScheduler!
        let mockSourceListModel: [SourceModel]! = MockData().stubSourceListModel()!.sources

        describe("SourcesViewModel Tests") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)
                mockGetSourcesHandler = MockNewsSourceNetworkHandling()
                stub(mockGetSourcesHandler, block: { stub in
                    when(stub.getSources()).thenReturn(Observable.empty())
                })
                testViewModel = SourcesViewModel(withNetworkHandling: mockGetSourcesHandler)
            }

            it("sets the title correctly") {
                expect(testViewModel.title).to(equal("Select Sources"))
            }

            describe("Get Sources info from server", {
                context("When server request succeed") {
                    beforeEach {
                        stub(mockGetSourcesHandler, block: { stub in
                            when(stub.getSources()).thenReturn(Observable.just(mockSourceListModel))
                        })

                        testScheduler.scheduleAt(300) {
                            testViewModel.viewDidLoad()
                        }
                        testViewModel.viewDidLoad()
                    }
                    it("it completed successfully") {
                        verify(mockGetSourcesHandler).getSources()
                    }
                    it("it sets numberOfRowsInSection correctly") {
                        expect(testViewModel.numberOfRowsInSection).to(equal(134))
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
                        let correctResult = [Recorded.next(200, false), Recorded.next(300, false)]
                        expect(res.events).to(equal(correctResult))
                    }
                }

                context("when server request failed") {
                    beforeEach {
                        stub(mockGetSourcesHandler, block: { stub in
                            when(stub.getSources()).thenReturn(Observable.error(mockError))
                        })
                        testScheduler.scheduleAt(300) {
                            testViewModel.viewDidLoad()
                        }
                        testViewModel.viewDidLoad()
                    }
                    it("it completed successfully") {
                        verify(mockGetSourcesHandler).getSources()
                    }
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

                context("Get Sources for index") {
                    var mockResponse: [SourcesDTO]!

                    beforeEach {
                        stub(mockGetSourcesHandler, block: { stub in
                            when(stub.getSources()).thenReturn(Observable.just(mockSourceListModel))
                        })
                        mockResponse = mockSourceListModel.map { SourcesDTO($0) }
                        testViewModel.viewDidLoad()
                    }

                    it("it sets numberOfRowsInSection correctly") {
                        expect(testViewModel.numberOfRowsInSection).to(equal(134))
                    }

                    it("it sets SourcesDTO correctly") {
                        for item in mockResponse.enumerated() {
                            let (index, correctResult) = item
                            expect(testViewModel.infoForRowAt(index)).to(equal(correctResult))
                        }
                    }
                }
            })
        }
    }
}
