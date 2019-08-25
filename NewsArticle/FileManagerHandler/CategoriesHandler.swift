//
//  CategoriesHandler.swift
//  NewsArticle
//
//  Created by Nischal Hada on 25/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CategoriesHandler: CategoriesHandlerProtocol {

    private let fileManagerHandler: FileManagerHandlerProtocol!
    private let resource: FileManagerResource<CategoriesModel>!

    init(withFileManagerHandler fileManagerHandler: FileManagerHandlerProtocol = FileManagerHandler()) {
        self.fileManagerHandler = fileManagerHandler
        self.resource = FileManagerResource(fileName: "Categories")
    }

    func getCategories() -> Observable<CategoriesModel> {
       return fileManagerHandler.load(resource: resource)
    }

}

//var resource: FileManagerResource<CategoriesModel> = {
//    return FileManagerResource(fileName: "Categories")
//}()
