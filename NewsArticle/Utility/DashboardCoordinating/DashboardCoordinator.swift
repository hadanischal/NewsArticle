//
//  DashboardCoordinator.swift
//  NewsArticle
//
//  Created by Nischal Hada on 11/9/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import RxSwift

protocol DashboardCoordinating {
    func getRoute() -> Observable<DashboardRoute>
    func finished(route: DashboardRoute)
}

// ViewModel implementation for DashboardBuilder
final class DashboardCoordinator: DashboardCoordinating {
    private let routeSubject = PublishSubject<DashboardRoute>()

    func getRoute() -> Observable<DashboardRoute> {
        return routeSubject.asObserver().startWith(.newsList)
    }

    func finished(route: DashboardRoute) {
        switch route {
        case .newsList:
            routeSubject.onNext(.newsList)
        case .detail(let selectedNews):
            routeSubject.onNext(.detail(selectedNews: selectedNews))
        case .categories:
            routeSubject.onNext(.categories)
        case .sources:
            routeSubject.onNext(.sources)
        case .newsCategory(let category):
            routeSubject.onNext(.newsCategory(category: category))
        case .newsSource(let source):
            routeSubject.onNext(.newsSource(source: source))
        }
    }
}
