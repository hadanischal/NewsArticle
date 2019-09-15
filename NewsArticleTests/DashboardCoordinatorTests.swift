//
//  DashboardCoordinatorTests.swift
//  NewsArticleTests
//
//  Created by Nischal Hada on 11/9/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Cuckoo
import RxTest

@testable import NewsArticle
//swiftlint:disable function_body_length
class DashboardCoordinatorTests: QuickSpec {

    override func spec() {
        describe("The DashboardCoordinator") {
            var coordinator: DashboardCoordinator!
            var testScheduler: TestScheduler!
            let mockSourceListModel = MockData().stubSourceListModel()
            var mockSelectedNews: NewsModel!

            beforeEach {
                testScheduler = TestScheduler(initialClock: 0)
                if let selectedModel = MockData().stubArticlesList()?.articles[0] {
                    mockSelectedNews = selectedModel
                } else {
                    XCTAssert(false, "nil mock value")
                }
                coordinator = DashboardCoordinator()
            }
            describe("routing behaviour") {
                it("starts with newsList") {
                    let result = testScheduler.start { coordinator.getRoute() }
                    let expectedResult = [Recorded.next(200, DashboardRoute.newsList)]
                    expect(result.events).to(equal(expectedResult))
                }
                it("routes to detail after newsList") {
                    testScheduler.scheduleAt(300) {
                        coordinator.finished(route: .detail(selectedNews: mockSelectedNews))
                    }
                    let result = testScheduler.start { coordinator.getRoute() }
                    let expectedResult = [Recorded.next(200, DashboardRoute.newsList),
                                          Recorded.next(300, DashboardRoute.detail(selectedNews: mockSelectedNews))]
                    expect(result.events).to(equal(expectedResult))
                }
                it("routes to categories after newsList") {
                    testScheduler.scheduleAt(300) {
                        coordinator.finished(route: .categories)
                    }
                    let result = testScheduler.start { coordinator.getRoute() }
                    let expectedResult = [Recorded.next(200, DashboardRoute.newsList),
                                          Recorded.next(300, DashboardRoute.categories)]
                    expect(result.events).to(equal(expectedResult))
                }
                it("routes to sources after newsList") {
                    testScheduler.scheduleAt(300) {
                        coordinator.finished(route: .sources)
                    }
                    let result = testScheduler.start { coordinator.getRoute() }
                    let expectedResult = [Recorded.next(200, DashboardRoute.newsList),
                                          Recorded.next(300, DashboardRoute.sources)]
                    expect(result.events).to(equal(expectedResult))
                }
                it("routes to newsCategory after newsList") {
                    testScheduler.scheduleAt(300) {
                        coordinator.finished(route: .newsCategory(category: "sports"))
                    }
                    let result = testScheduler.start { coordinator.getRoute() }
                    let expectedResult = [Recorded.next(200, DashboardRoute.newsList),
                                          Recorded.next(300, DashboardRoute.newsCategory(category: "sports"))]
                    expect(result.events).to(equal(expectedResult))
                }
                it("routes to newsSource after newsList") {
                    if let sourceListModel = mockSourceListModel?.sources {
                        testScheduler.scheduleAt(300) {
                            coordinator.finished(route: .newsSource(source: sourceListModel[0]))
                        }
                        let result = testScheduler.start { coordinator.getRoute() }
                        let expectedResult = [Recorded.next(200, DashboardRoute.newsList),
                                              Recorded.next(300, DashboardRoute.newsSource(source: sourceListModel[0]))]
                        expect(result.events).to(equal(expectedResult))
                     } else {
                        XCTAssert(false, "nil mock value")
                    }
                }
            }
        }
    }
}
