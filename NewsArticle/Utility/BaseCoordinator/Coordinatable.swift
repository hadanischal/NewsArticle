//
//  Coordinatable.swift
//  NewsArticle
//
//  Created by Nischal Hada on 11/9/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import RxSwift

protocol Coordinatable {
    var isDone: Observable<DashboardRoute> { get }
}

extension Coordinatable {
    var isDone: Observable<Void> {
        return Observable.never()
    }
}
