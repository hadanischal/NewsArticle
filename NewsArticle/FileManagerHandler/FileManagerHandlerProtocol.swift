//
//  FileManagerHandlerProtocol.swift
//  NewsArticle
//
//  Created by Nischal Hada on 25/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import RxSwift

protocol FileManagerHandlerProtocol {
    func load<T: Decodable>(resource: FileManagerResource<T>) -> Observable<T>
}
