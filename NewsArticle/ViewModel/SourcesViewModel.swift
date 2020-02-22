//
//  SourcesViewModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 31/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import RxSwift

final class SourcesViewModel: SourcesDataSource {
    var isDone: Observable<DashboardRoute>
    let newsList: Observable<[SourceModel]>

    private let sourcesHandler: GetSourcesHandlerProtocol!
    private let newsListSubject = PublishSubject<[SourceModel]>()
    private let isDoneSubject = PublishSubject<DashboardRoute>()
    private let disposeBag = DisposeBag()

    init(withSourcesHandler sourcesHandler: GetSourcesHandlerProtocol = GetSourcesHandler()) {
        self.sourcesHandler = sourcesHandler
        self.newsList = newsListSubject.asObserver()
        self.isDone = isDoneSubject.asObserver()
        getSources()
    }

    var title: Observable<String> {
        return Observable.just("Select Sources")
    }

    func getSources() {
        sourcesHandler.getSources()
            .subscribe(onNext: { [weak self] newsResult in
                if let newsList = newsResult?.sources {
                    self?.newsListSubject.onNext(newsList)
                } else {
                    self?.newsListSubject.onError(RxError.noElements)
                }
                }, onError: { [weak self] error in
                    self?.newsListSubject.onError(error)
            }).disposed(by: disposeBag)
    }

    func updateNews(withSource source: SourceModel) {
        isDoneSubject.onNext(.newsSource(source: source))
    }

}
