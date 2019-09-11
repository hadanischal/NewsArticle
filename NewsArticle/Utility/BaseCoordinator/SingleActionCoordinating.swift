//
//  SingleActionCoordinating.swift
//  NewsArticle
//
//  Created by Nischal Hada on 11/9/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import RxSwift

protocol SingleActionCoordinating: Coordinatable {
    func doNextAction()
}

extension SingleActionCoordinating {

    func doNextAction() { /* Implmented in subclasses */ }
}
