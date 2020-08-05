//
//  CategoriesViewModelTests.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 25/8/19.
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

class CategoriesViewModelTests: QuickSpec {
    override func spec() {
        var testViewModel: CategoriesViewModel!
        var mockCategoriesHandler: MockCategoriesHandlerProtocol!
        var testScheduler: TestScheduler!
        let mockCategoriesList = [
            "Business",
            "Entertainment",
            "Health",
            "Science",
            "Sports",
            "Technology"
        ]
        let mockCategory = CategoriesModel(categories: mockCategoriesList)

        describe("CategoriesViewModel Test") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)
                mockCategoriesHandler = MockCategoriesHandlerProtocol()
                stub(mockCategoriesHandler, block: { stub in
                    when(stub.getCategories()).thenReturn(Observable.empty())
                })
                testViewModel = CategoriesViewModel(withCategoriesHandler: mockCategoriesHandler)
            }

            describe("Get Categories info", {
                context("When get Categories get succeed") {
                    beforeEach {
                        stub(mockCategoriesHandler, block: { stub in
                            when(stub.getCategories()).thenReturn(Observable.just(mockCategory))
                        })

                        testScheduler.scheduleAt(300) {
                            testViewModel.viewDidLoad()
                        }
                        testViewModel.viewDidLoad()
                    }
                    it("it completed successfully") {
                        verify(mockCategoriesHandler).getCategories()
                    }
                    it("it sets numberOfRowsInSection correctly") {
                        expect(testViewModel.numberOfRowsInSection).to(equal(6))
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

                context("When get Categories request failed") {
                    beforeEach {
                        stub(mockCategoriesHandler, block: { stub in
                            when(stub.getCategories()).thenReturn(Observable.error(mockError))
                        })
                        testScheduler.scheduleAt(300) {
                            testViewModel.viewDidLoad()
                        }
                        testViewModel.viewDidLoad()
                    }
                    it("it completed successfully") {
                        verify(mockCategoriesHandler).getCategories()
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

                context("Get sources info for index") {
                    beforeEach {
                        stub(mockCategoriesHandler, block: { stub in
                            when(stub.getCategories()).thenReturn(Observable.just(mockCategory))
                        })
                        testViewModel.viewDidLoad()
                    }

                    it("it sets numberOfRowsInSection correctly") {
                        expect(testViewModel.numberOfRowsInSection).to(equal(6))
                    }

                    it("it sets categories info correctly") {
                        for item in mockCategory.categories!.enumerated() {
                            let (index, mockDiseaseModel) = item
                            expect(testViewModel.infoForRowAt(index)).to(equal(mockDiseaseModel))
                        }
                    }
                }
            })
        }
    }
}
