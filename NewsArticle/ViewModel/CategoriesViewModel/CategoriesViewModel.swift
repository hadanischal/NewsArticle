//
//  CategoriesViewModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 25/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import RxSwift

protocol CategoriesDataSource: BaseViewModelDataSource {
    var title: String { get }
    var numberOfRowsInSection: Int { get }
    func infoForRowAt(_ index: Int) -> String
}

final class CategoriesViewModel: CategoriesDataSource {
    var title: String { L10n.DashBoard.categoriesNavigationTitle }
    var numberOfRowsInSection: Int { categoriesList.count }

    let updateInfo: Observable<Bool>
    let errorResult: Observable<Error>
    let isLoading: Observable<Bool>

    private let disposeBag = DisposeBag()
    private var categoriesList = [String]()
    private let categoriesHandler: CategoriesHandlerProtocol

    private let updateInfoSubject = PublishSubject<Bool>()
    private let errorResultSubject = PublishSubject<Error>()
    private let loadingSubject = BehaviorSubject<Bool>(value: true)

    init(withCategoriesHandler categoriesHandler: CategoriesHandlerProtocol = CategoriesHandler()) {
        self.categoriesHandler = categoriesHandler

        self.updateInfo = updateInfoSubject.asObservable()
        self.errorResult = errorResultSubject.asObservable()
        self.isLoading = loadingSubject.asObservable()
    }

    func viewDidLoad() {
        categoriesHandler.getCategories()
            .compactMap { $0.categories }
            .subscribe(onNext: { [weak self] result in
                self?.categoriesList = result
                self?.updateInfoSubject.onNext(true)
                self?.loadingSubject.onNext(false)
                }, onError: { [weak self] error in

                    self?.errorResultSubject.on(.next(error))
                    self?.loadingSubject.onNext(false)

            })
            .disposed(by: disposeBag)
    }

    func infoForRowAt(_ index: Int) -> String { categoriesList[index] }
}
