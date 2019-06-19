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
    var viewModel: NewsListViewModelProtocol = NewsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"
        viewModel.newsList
            .subscribe(onNext: { [weak self] chores in
                self?.newsList = chores
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            })
            .disposed(by: disposeBag)
        viewModel.viewDidStart()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
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

