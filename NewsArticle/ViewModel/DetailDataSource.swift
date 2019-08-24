//
//  DetailDataSource.swift
//  NewsArticle
//
//  Created by Nischal Hada on 23/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import RxSwift

protocol DetailDataSource {
    var newsList: Observable<[NewsModel]> { get }
    var title: Observable<String> { get }
}
