//
//  WebService.swift
//  NewsArticle
//
//  Created by Nischal Hada on 20/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import RxSwift

protocol WebServiceProtocol {
    func load<T: Decodable>(resource: Resource<T>) -> Observable<T>
}

final class WebService: WebServiceProtocol {
    func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {
        return URLRequest.load(resource: resource)
    }
}
