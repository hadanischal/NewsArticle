//
//  SourcesViewModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 31/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import RxSwift

class SourcesViewModel: SourcesDataSource {
    private let sourcesHandler: GetSourcesHandlerProtocol!
    let newsList: Observable<[SourceModel]>

    private let newsListSubject = PublishSubject<[SourceModel]>()
    private let disposeBag = DisposeBag()

    init(withSourcesHandler sourcesHandler: GetSourcesHandlerProtocol = GetSourcesHandler()) {
        self.sourcesHandler = sourcesHandler
        self.newsList = newsListSubject.asObserver()
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

}
