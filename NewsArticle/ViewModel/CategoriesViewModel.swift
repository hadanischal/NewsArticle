//
//  CategoriesViewModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 25/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import RxSwift

final class CategoriesViewModel: CategoriesDataSource {
    var isDone: Observable<DashboardRoute>

    private let categoriesHandler: CategoriesHandlerProtocol!
    private let isDoneSubject = PublishSubject<DashboardRoute>()

    init(withCategoriesHandler categoriesHandler: CategoriesHandlerProtocol = CategoriesHandler()) {
        self.categoriesHandler = categoriesHandler
        self.isDone = isDoneSubject.asObserver()
    }

    func getCategories() -> Observable<CategoriesModel> {
        return categoriesHandler.getCategories()
    }

    func updateNews(withCategory category: String) {
        isDoneSubject.onNext(.newsCategory(category: category))
    }
}
