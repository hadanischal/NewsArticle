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
    var title: Observable<String> {
        return titleSubject.asObservable()
    }

    private let newsListSubject = PublishSubject<[NewsModel]>()
    private let titleSubject = BehaviorRelay<String>(value: "News")

    init(withGetNews getNews: GetNewsHandlerProtocol = GetNewsHandler()) {
        self.getNews = getNews
        self.newsList = newsListSubject.asObserver()
        self.getTopHeadlines(withParameter: nil)
        self.addScheduler()
    }

    private func addScheduler() {
        let scheduler = SerialDispatchQueueScheduler(qos: .default)
        Observable<Int>.interval(.seconds(300), scheduler: scheduler)
            .subscribe { [weak self] _ in
                self?.getTopHeadlines(withParameter: nil)
            }.disposed(by: disposeBag)
    }

    func updateNews(withCategory category: String) {
        let param: [String: String] = ["country": ApiKey.countryGB,
                                       "category": category]
        self.titleSubject.accept(category)
        self.getTopHeadlines(withParameter: param)
    }

    func updateNews(withSource source: SourceModel) {
        self.titleSubject.accept(source.name ?? "News")
        guard let sourceId = source.id else {
            return
        }

        let param: [String: String] = [
            ApiKey.sources: sourceId]

        self.getTopHeadlines(withParameter: param)
    }

    func getTopHeadlines(withParameter param: [String: String]?) {
        getNews.getTopHeadlines(withParameter: param)
            .subscribe(onNext: { [weak self] result in
                if let result = result {
                    let articles = result.articles
                    self?.newsListSubject.onNext(articles)
                }
                }, onError: { [weak self] error in
                    self?.newsListSubject.onError(error)
            })
            .disposed(by: disposeBag)
    }

}
