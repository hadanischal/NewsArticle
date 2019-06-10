//
//  NewsViewController.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/10/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsViewController: UITableViewController {

    private let disposeBag = DisposeBag()
    private var newsList = [NewsModel]()

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
        return self.newsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {
            fatalError("NewsTableViewCell does not exist")
        }
        cell.titleLabel.text = self.newsList[indexPath.row].title
        cell.descriptionLabel.text = self.newsList[indexPath.row].description
        return cell
    }

}

extension NewsViewController {

    private func populateNews() {
        URLRequest.load(resource: ArticlesList.resource)
            .subscribe(onNext: { [weak self] result in
                if let result = result {
                    self?.newsList = result.articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
    }

}
