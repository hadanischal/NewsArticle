//
//  NewsListViewController.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/10/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsListViewController: UITableViewController {

    private let disposeBag = DisposeBag()
    private var newsList = [NewsModel]()
    private var articleListVM: ArticleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"
        self.populateNews()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM == nil ? 0: self.articleListVM.articlesVM.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {
            fatalError("NewsTableViewCell does not exist")
        }
//        cell.titleLabel.text = self.newsList[indexPath.row].title
//        cell.descriptionLabel.text = self.newsList[indexPath.row].description
        let articleVM = self.articleListVM.articleAt(indexPath.row)
        
        articleVM.title.asDriver(onErrorJustReturn: "")
            .drive(cell.titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        articleVM.description.asDriver(onErrorJustReturn: "")
            .drive(cell.descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        return cell
    }

}

extension NewsListViewController {

    private func populateNews() {
        URLRequest.load(resource: ArticlesList.resource)
            .subscribe(onNext: { [weak self] result in
                if let result = result {
//                    self?.newsList = result.articles
                    let articles = result.articles
                    self?.articleListVM = ArticleListViewModel(articles)
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
    }

}

