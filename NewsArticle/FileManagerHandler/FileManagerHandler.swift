//
//  FileManagerHandler.swift
//  NewsArticle
//
//  Created by Nischal Hada on 25/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit
import RxSwift

struct FileManagerResource<T> {
    let fileName: String
}

class FileManagerHandler: FileManagerHandlerProtocol {
    init() {}
    
    func load<T: Decodable>(resource: FileManagerResource<T>) -> Observable<T> {
        return Observable<T>.create { observer in
            
            if let url = Bundle.main.url(forResource: resource.fileName, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(T.self, from: data)
                    observer.on(.next(jsonData))
                    observer.on(.completed)
                } catch (let error) {
                    print("error:\(error)")
                    observer.on(.error(error))
                }
            }
            return Disposables.create()
        }
    }
}
