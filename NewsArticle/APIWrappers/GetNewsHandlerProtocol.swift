//
//  GetNewsHandlerProtocol.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import RxSwift

protocol GetNewsHandlerProtocol {
    func getTopHeadlines(withParameter param: [String: String]?) -> Observable<ArticlesList?>
}
