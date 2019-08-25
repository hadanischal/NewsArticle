//
//  NewsListViewModelProtocol.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit
import RxSwift

protocol NewsListViewModelProtocol {
    var newsList: Observable<[NewsModel]> { get }
    func populateNews(withCategory category: String)
}

extension NewsListViewModelProtocol {
    func populateNews(withCategory category: String = ApiKey.categorySports) {
        populateNews(withCategory: category)
    }
}
