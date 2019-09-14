//
//  DetailViewModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 23/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import RxSwift

struct DetailViewModel: DetailDataSource {
    let title: Observable<String>
    let newsList: Observable<[NewsModel]>

    private let newsInfo: NewsModel!
    private let disposeBag = DisposeBag()

    init(withNewsModel newsInfo: NewsModel?) {
        self.newsInfo = newsInfo
        self.newsList = Observable.just([self.newsInfo])
        self.title = Observable.just(self.newsInfo.title ?? "")
    }
}
