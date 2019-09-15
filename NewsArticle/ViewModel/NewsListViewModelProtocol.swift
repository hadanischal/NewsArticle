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
    var title: Observable<String> { get }
    var newsList: Observable<[NewsModel]> { get }
    var isDone: Observable<DashboardRoute> { get }

    func getTopHeadlines(withParameter param: [String: String]?)
    func updateNews(withCategory category: String)
    func updateNews(withSource source: SourceModel)
    func getRoute(withCategoriesButtonTap categoriesButtonTap: Observable<Void>,
                  withSourcesButtonTap sourcesButtonTap: Observable<Void>,
                  withNewsListdidSelectRow didSelectRow: Observable<NewsModel>)
}
