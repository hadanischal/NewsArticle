//
//  NewsListViewModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class NewsListViewModel: NewsListViewModelProtocol {
    private let getNews: GetNewsHandlerProtocol
    private let disposeBag = DisposeBag()
    var newsList: Observable<[NewsModel]>
    
    private let newsListSubject = PublishSubject<[NewsModel]>()

    init(withGetNews getNews: GetNewsHandlerProtocol = GetNewsHandler()) {
        self.getNews = getNews
        self.newsList = newsListSubject.asObserver()
    }
    
    func viewDidStart() {
        getNews.populateNews()
            .subscribe(onNext: { [weak self] result in
                if let result = result {
                    let articles = result.articles
                   self?.newsListSubject.onNext(articles)
                }
            }).disposed(by: disposeBag)
    }
}
