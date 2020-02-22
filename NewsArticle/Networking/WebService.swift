//
//  WebService.swift
//  NewsArticle
//
//  Created by Nischal Hada on 27/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import RxSwift

final class WebService: WebServiceProtocol {
    func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {
        return URLRequest.load(resource: resource)
    }
}
