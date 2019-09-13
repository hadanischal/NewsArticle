//
//  CategoriesViewModelTests.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 25/8/19.
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

        describe("CategoriesViewModel") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)
                mockCategoriesHandler = MockCategoriesHandlerProtocol()
                stub(mockCategoriesHandler, block: { stub in
                    when(stub.getCategories()).thenReturn(Observable.empty())
                })
                testViewModel = CategoriesViewModel(withCategoriesHandler: mockCategoriesHandler)
            }

            describe("Get news info on initialization", {
                context("when get news succeed ", {
                    beforeEach {
                        stub(mockCategoriesHandler, block: { stub in
                            when(stub.getCategories()).thenReturn(Observable.just(mockCategory))
                        })
                    }
                    it("it completed successfully", closure: {
                        _ = testViewModel.getCategories().asObservable()
                        verify(mockCategoriesHandler).getCategories()
                    })
                    it("emits the news list to the UI", closure: {

                        let res = testScheduler.start { testViewModel.getCategories().asObservable() }
                        expect(res.events.count).to(equal(2))
                        let correctResult = [Recorded.next(200, mockCategory),
                                             Recorded.completed(200)]
                        expect(res.events).to(equal(correctResult))
                    })
                })

                context("when get news failed ", {
                    beforeEach {
                        stub(mockCategoriesHandler, block: { stub in
                            when(stub.getCategories()).thenReturn(Observable.error(mockError))
                        })
                    }
                    it("it completed successfully", closure: {
                        _ = testViewModel.getCategories().asObservable()
                        verify(mockCategoriesHandler).getCategories()
                    })
                    it("emits the news list to the UI", closure: {
                        let res = testScheduler.start { testViewModel.getCategories().asObservable() }
                        expect(res.events.count).to(equal(1))
                        let correctResult = [Recorded.error(200, mockError, CategoriesModel.self)]
                        expect(res.events).to(equal(correctResult))
                    })
                })

                context("when Categories is selected", {

                    beforeEach {
                        testScheduler.scheduleAt(300, action: {
                            testViewModel.updateNews(withCategory: "Business")
                        })
                    }

                    it("emits newsCategory with category DashboardRoute to UI", closure: {
                        let testObservable =  testViewModel.isDone
                        let res = testScheduler.start { testObservable }

                        expect(res.events.count).to(equal(1))
                        let correctResult = [Recorded.next(300, DashboardRoute.newsCategory(category: "Business"))]
                        expect(res.events).to(equal(correctResult))
                    })

                 })
            })
        }
    }
}
