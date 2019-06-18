//
//  GetNewsHandler.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class GetNewsHandler: GetNewsHandlerProtocol {
    init() {
        
    }
    
    func populateNews() -> Observable<ArticlesList?> {
        return URLRequest.load(resource: ArticlesList.resource)
            .map{ article -> ArticlesList? in
                return article
            }.asObservable()
            .retry(2)
    }
    
}

