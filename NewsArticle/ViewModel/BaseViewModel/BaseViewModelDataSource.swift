//
//  BaseViewModelDataSource.swift
//  NewsArticle
//
//  Created by Nischal Hada on 21/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import Foundation
import RxSwift

protocol BaseViewModelDataSource: AnyObject {
    var updateInfo: Observable<Bool> { get }
    var errorResult: Observable<Error> { get }
    var isLoading: Observable<Bool> { get }
    func viewDidLoad()
}
