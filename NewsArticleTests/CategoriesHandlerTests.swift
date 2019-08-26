//
//  CategoriesHandlerTests.swift
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

class CategoriesHandlerTests: QuickSpec {

    override func spec() {
        var testHandler: CategoriesHandler!
        var mockFileManagerHandler: MockFileManagerHandlerProtocol!
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

        describe("CategoriesHandler") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)
                mockFileManagerHandler = MockFileManagerHandlerProtocol()

                stub(mockFileManagerHandler, block: { stub in
                    when(stub.load(resource: any(FileManagerResource<CategoriesModel>.self))).thenReturn(Observable.error(RxError.noElements))
                })
                testHandler = CategoriesHandler(withFileManagerHandler: mockFileManagerHandler)
            }

            describe("Get news info on initialization", {
                context("when get news succeed ", {
                    beforeEach {
                        stub(mockFileManagerHandler, block: { stub in
                            when(stub.load(resource: any(FileManagerResource<CategoriesModel>.self))).thenReturn(Observable.just(mockCategory))
                        })
                    }
                    it("it completed successfully", closure: {
                        _ = testHandler.getCategories().asObservable()
                        verify(mockFileManagerHandler).load(resource: any(FileManagerResource<CategoriesModel>.self))
                    })
                    it("emits the news list to the UI", closure: {

                        let res = testScheduler.start { testHandler.getCategories() }
                        expect(res.events.count).to(equal(2))
                        let correctResult = [Recorded.next(200, mockCategory),
                                             Recorded.completed(200)]
                        expect(res.events).to(equal(correctResult))
                    })
                })

                context("when get news failed ", {

                    beforeEach {
                        stub(mockFileManagerHandler, block: { stub in
                            when(stub.load(resource: any(FileManagerResource<CategoriesModel>.self))).thenReturn(Observable.error(mockError))
                        })
                    }
                    it("it completed successfully", closure: {
                        _ = testHandler.getCategories().asObservable()
                        verify(mockFileManagerHandler).load(resource: any(FileManagerResource<CategoriesModel>.self))
                    })
                    it("emits the news list to the UI", closure: {
                        let res = testScheduler.start { testHandler.getCategories() }
                        expect(res.events.count).to(equal(1))
                        let correctResult = [Recorded.error(200, mockError, CategoriesModel.self)
                        ]
                        expect(res.events).to(equal(correctResult))
                    })
                })
            })

        }
    }
}
