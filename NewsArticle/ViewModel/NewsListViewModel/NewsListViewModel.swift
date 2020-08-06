//
//  NewsListViewModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol NewsListViewModelDataSource: BaseViewModelDataSource {
    var title: Observable<String> { get }
    var numberOfRowsInSection: Int { get }

    func infoForRowAt(_ index: Int) -> NewsListDTO
    func updateNews(withCategory category: String)
    func updateNews(withSource source: SourcesDTO)
}

final class NewsListViewModel: NewsListViewModelDataSource {
    var title: Observable<String> { titleSubject.asObservable() }
    var numberOfRowsInSection: Int { newsList.count }

    let updateInfo: Observable<Bool>
    let errorResult: Observable<Error>
    let isLoading: Observable<Bool>

    private let disposeBag = DisposeBag()
    private var newsList = [NewsListDTO]()
    private let newsNetworkHandler: NewsListNetworkHandling

    private let newsListSubject = PublishSubject<[NewsModel]>()
    private let titleSubject = BehaviorSubject<String>(value: L10n.DashBoard.newsListNavigationTitle)

    private let updateInfoSubject = PublishSubject<Bool>()
    private let errorResultSubject = PublishSubject<Error>()
    private let loadingSubject = BehaviorSubject<Bool>(value: true)

    init(withNetworkHandling networkHandling: NewsListNetworkHandling = NewsNetworkHandler()) {
        self.newsNetworkHandler = networkHandling

        self.updateInfo = updateInfoSubject.asObservable()
        self.errorResult = errorResultSubject.asObservable()
        self.isLoading = loadingSubject.asObservable()
    }

    func viewDidLoad() {
        getTopHeadlines()
    }

    func infoForRowAt(_ index: Int) -> NewsListDTO { self.newsList[index] }

    func updateNews(withCategory category: String) {
        let param: [String: String] = [ApiKey.country: Environment.Variables.countryGB,
                                       ApiKey.category: category]

        self.titleSubject.onNext(category)
        self.getTopHeadlines(param)
    }

    func updateNews(withSource source: SourcesDTO) {
        titleSubject.onNext(source.name)
        let param: [String: String] = [ApiKey.sources: source.id]
        getTopHeadlines(param)
    }

    func getTopHeadlines(_ param: [String: String]? = nil) {
        newsNetworkHandler
            .getTopHeadlines(param)
            .compactMap({ list -> [NewsListDTO] in
                list.map { NewsListDTO($0) }
            })
            .subscribe(onNext: { [weak self] result in
                self?.newsList = result
                self?.updateInfoSubject.onNext(true)
                self?.loadingSubject.onNext(false)
                }, onError: { [weak self] error in

                    self?.errorResultSubject.on(.next(error))
                    self?.loadingSubject.onNext(false)

            })
            .disposed(by: disposeBag)
    }
}
