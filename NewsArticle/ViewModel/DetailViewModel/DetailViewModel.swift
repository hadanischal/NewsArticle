//
//  DetailViewModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 23/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

protocol DetailDataSource: AnyObject {
    var title: String { get }
    var numberOfRowsInSection: Int { get }
    func infoForRowAt(_ index: Int) -> NewsListDTO
}

final class DetailViewModel: DetailDataSource {
    var title: String
    var numberOfRowsInSection: Int { sourcesList.count }

    private let newsInfo: NewsListDTO!
    private var sourcesList = [NewsListDTO]()

    init(withNewsModel newsInfo: NewsListDTO) {
        self.newsInfo = newsInfo
        self.sourcesList = [newsInfo]
        self.title = newsInfo.title
    }

    func infoForRowAt(_ index: Int) -> NewsListDTO { sourcesList[index] }
}
