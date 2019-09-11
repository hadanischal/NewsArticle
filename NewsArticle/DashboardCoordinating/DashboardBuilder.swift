//
//  DashboardBuilder.swift
//  NewsArticle
//
//  Created by Nischal Hada on 11/9/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import RxSwift

// View layer for Coordinator
final class DashboardBuilder: CoordinatorBuilding {
    private let navController: UINavigationController
    private let navigator: DashboardCoordinating
    private let storyboard: UIStoryboard!
    private let newsListViewModel: NewsListViewModel!
    private let disposeBag = DisposeBag()

    init(navController: UINavigationController = NavigationController(),
         navigator: DashboardCoordinating = DashboardCoordinator()) {
        self.navController = navController
        self.navigator = navigator
        self.storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.newsListViewModel = NewsListViewModel()

        navigator.getRoute()
            .subscribe(onNext: { [weak self] route in
                self?.navigate(withRoute: route)
            }).disposed(by: disposeBag)
    }

    //GET route info from VM
    private func navigate(withRoute route: DashboardRoute) {
        switch route {
        case .newsList:
            routeToNewsList()
        case .detail:
            routeToDetail()
        case .categories:
            routeToCategories()
        case .sources:
            routeToSources()
        case .newsCategory(let category):
            updateNews(withCategory: category)
        case .newsSource(let source):
            updateNews(withSource: source)
        }
    }

}

extension DashboardBuilder {

    func routeToNewsList() {}

    func routeToDetail() {}

    func routeToCategories() {}

    func routeToSources() {}

    func updateNews(withCategory category: String) {}

    func updateNews(withSource source: SourceModel) {}
}
