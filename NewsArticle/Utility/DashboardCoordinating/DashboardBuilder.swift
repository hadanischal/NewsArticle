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
    private let newsListViewModel: NewsListViewModel
    private let disposeBag = DisposeBag()

    init(navController: UINavigationController = NavigationController(),
         navigator: DashboardCoordinating = DashboardCoordinator()) {
        self.navController = navController
        self.navigator = navigator
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
        case .detail(let selectedNews):
            routeToDetail(withSelectedNews: selectedNews)
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

    //Initial Screen
    func routeToNewsList() {
        let viewModel = self.newsListViewModel
        let newsViewController = StoryboardScene.Main.newsListViewController.instantiate()
        newsViewController.viewModel = viewModel
        viewModel.isDone
            .subscribe(onNext: { [weak self] route in
                //pass route info to Coordinator VM
                self?.navigator.finished(route: route)
            }).disposed(by: disposeBag)
        navController.pushViewController(newsViewController, animated: true)
    }

    func routeToDetail(withSelectedNews selectedNews: NewsModel) {
        let detailViewModel = DetailViewModel(withNewsModel: selectedNews)
        let detailViewController = StoryboardScene.Main.detailTableViewController.instantiate()
        detailViewController.viewModel = detailViewModel
        navController.pushViewController(detailViewController, animated: true)
    }

    func routeToCategories() {
        let categoriesViewModel = CategoriesViewModel()
        let categoriesViewController = StoryboardScene.Main.categoriesTableViewController.instantiate()
        categoriesViewController.viewModel = categoriesViewModel
        categoriesViewModel.isDone
            .subscribe(onNext: { [weak self] route in
                self?.navigator.finished(route: route)
                categoriesViewController.dismiss(animated: true)
            }).disposed(by: disposeBag)
        navController.present(NavigationController(rootViewController: categoriesViewController), animated: true)

    }

    func routeToSources() {
        let viewModel = SourcesViewModel()
        let sourcesViewController = StoryboardScene.Main.sourcesTableViewController.instantiate()
        sourcesViewController.viewModel = viewModel
        viewModel.isDone
            .subscribe(onNext: { [weak self] route in
                //pass route info to Coordinator VM
                self?.navigator.finished(route: route)
            }).disposed(by: disposeBag)
        navController.present(NavigationController(rootViewController: sourcesViewController), animated: true)
    }

    func updateNews(withCategory category: String) {
        newsListViewModel.updateNews(withCategory: category)
    }

    func updateNews(withSource source: SourceModel) {
        newsListViewModel.updateNews(withSource: source)
    }
}
