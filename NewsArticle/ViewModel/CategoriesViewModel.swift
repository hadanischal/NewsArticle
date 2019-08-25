//
//  CategoriesViewModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 25/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import RxSwift

class CategoriesViewModel: CategoriesDataSource {
    private let categoriesHandler: CategoriesHandlerProtocol!

    init(withCategoriesHandler categoriesHandler: CategoriesHandlerProtocol = CategoriesHandler()) {
        self.categoriesHandler = categoriesHandler
    }

    func getCategories() -> Observable<CategoriesModel> {
        return categoriesHandler.getCategories()
    }

}
