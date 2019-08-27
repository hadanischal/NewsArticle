//
//  WebServiceProtocol.swift
//  NewsArticle
//
//  Created by Nischal Hada on 27/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import RxSwift

protocol WebServiceProtocol {
    func load<T: Decodable>(resource: Resource<T>) -> Observable<T>
}
