//
//  CategoriesHandler.swift
//  NewsArticle
//
//  Created by Nischal Hada on 22/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import Foundation
import RxSwift

protocol CategoriesHandlerProtocol {
    func getCategories() -> Observable<CategoriesModel>
    func getEndpoint() -> Observable<EndpointsModel>
}

final class CategoriesHandler: CategoriesHandlerProtocol {
    private let fileManagerHandler: FileManagerHandlerProtocol!

    init(withFileManagerHandler fileManagerHandler: FileManagerHandlerProtocol = FileManagerHandler()) {
        self.fileManagerHandler = fileManagerHandler
    }

    func getCategories() -> Observable<CategoriesModel> {
         let resource: FileManagerResource<CategoriesModel> = {
            FileManagerResource(fileName: "Categories")
         }()

        return fileManagerHandler
            .load(resource: resource)
    }

    func getEndpoint() -> Observable<EndpointsModel> {
        let resource: FileManagerResource<EndpointsModel> = {
             FileManagerResource(fileName: "Endpoints")
          }()

        return fileManagerHandler
            .load(resource: resource)
    }
}
