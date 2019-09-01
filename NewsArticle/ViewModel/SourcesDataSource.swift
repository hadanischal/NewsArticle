//
//  SourcesDataSource.swift
//  NewsArticle
//
//  Created by Nischal Hada on 31/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import RxSwift

protocol SourcesDataSource {
    func getSources()
    var newsList: Observable<[SourceModel]> { get }
    var title: Observable<String> { get }
}
