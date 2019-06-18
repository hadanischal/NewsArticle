//
//  NewsListViewModel.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct ArticleListViewModel {
    let articlesVM: [ArticleViewModel]
}

extension ArticleListViewModel {
    
    init(_ articles: [NewsModel]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
    }
    
}

extension ArticleListViewModel {
    
    func articleAt(_ index: Int) -> ArticleViewModel {
        return self.articlesVM[index]
    }
}

struct ArticleViewModel {
    
    let article: NewsModel
    
    init(_ article: NewsModel) {
        self.article = article
    }
    
}

extension ArticleViewModel {
    
    var title: Observable<String> {
        return Observable<String>.just(article.title ?? "")
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
    
}
