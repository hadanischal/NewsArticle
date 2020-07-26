//
//  CategoriesHandlerTests.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 25/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Cuckoo
import Nimble
import Quick
import RxBlocking
import RxSwift
import RxTest
import XCTest

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

        describe("CategoriesHandler tests") {
            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)
                mockFileManagerHandler = MockFileManagerHandlerProtocol()

                stub(mockFileManagerHandler) { stub in
                    when(stub.load(resource: any(FileManagerResource<CategoriesModel>.self))).thenReturn(Observable.error(RxError.noElements))
                }
                testHandler = CategoriesHandler(withFileManagerHandler: mockFileManagerHandler)
            }

            describe("Get Categories") {
                context("when get Categories succeed ") {
                    beforeEach {
                        stub(mockFileManagerHandler) { stub in
                            when(stub.load(resource: any(FileManagerResource<CategoriesModel>.self))).thenReturn(Observable.just(mockCategory))
                        }
                    }
                    it("it completed successfully") {
                        _ = testHandler.getCategories().asObservable()
                        verify(mockFileManagerHandler).load(resource: any(FileManagerResource<CategoriesModel>.self))
                    }
                    it("emits the news list to the UI") {
                        let res = testScheduler.start { testHandler.getCategories() }
                        expect(res.events.count).to(equal(2))
                        let correctResult = [Recorded.next(200, mockCategory),
                                             Recorded.completed(200)]
                        expect(res.events).to(equal(correctResult))
                    }
                }

                context("when get Categories failed ") {
                    beforeEach {
                        stub(mockFileManagerHandler) { stub in
                            when(stub.load(resource: any(FileManagerResource<CategoriesModel>.self))).thenReturn(Observable.error(mockError))
                        }
                    }
                    it("it completed successfully") {
                        _ = testHandler.getCategories().asObservable()
                        verify(mockFileManagerHandler).load(resource: any(FileManagerResource<CategoriesModel>.self))
                    }
                    it("emits the news list to the UI") {
                        let res = testScheduler.start { testHandler.getCategories() }
                        expect(res.events.count).to(equal(1))
                        let correctResult = [Recorded.error(200, mockError, CategoriesModel.self)]
                        expect(res.events).to(equal(correctResult))
                    }
                }
            }

            describe("Get Endpoint") {
                let mockEndpointsModel: EndpointsModel! = MockData().stubEndpointsModel()

                context("when get Endpoint succeed ") {
                    beforeEach {
                        stub(mockFileManagerHandler) { stub in
                            when(stub.load(resource: any(FileManagerResource<EndpointsModel>.self))).thenReturn(Observable.just(mockEndpointsModel))
                        }
                    }
                    it("it completed successfully") {
                        _ = testHandler.getEndpoint().asObservable()
                        verify(mockFileManagerHandler).load(resource: any(FileManagerResource<EndpointsModel>.self))
                    }
                    it("emits the news list to the UI") {
                        let res = testScheduler.start { testHandler.getEndpoint() }
                        expect(res.events.count).to(equal(2))
                        let correctResult = [Recorded.next(200, mockEndpointsModel!),
                                             Recorded.completed(200)]
                        expect(res.events).to(equal(correctResult))
                    }
                }

                context("when get Endpoint failed ") {
                    beforeEach {
                        stub(mockFileManagerHandler) { stub in
                            when(stub.load(resource: any(FileManagerResource<EndpointsModel>.self))).thenReturn(Observable.error(mockError))
                        }
                    }
                    it("it completed successfully") {
                        _ = testHandler.getEndpoint().asObservable()
                        verify(mockFileManagerHandler).load(resource: any(FileManagerResource<EndpointsModel>.self))
                    }
                    it("emits the news list to the UI") {
                        let res = testScheduler.start { testHandler.getEndpoint() }
                        expect(res.events.count).to(equal(1))
                        let correctResult = [Recorded.error(200, mockError, EndpointsModel.self)]
                        expect(res.events).to(equal(correctResult))
                    }
                }
            }
        }
    }
}
