//
//  DetailTableViewController.swift
//  NewsArticle
//
//  Created by Nischal Hada on 21/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DetailTableViewController: UITableViewController {

    private let disposeBag = DisposeBag()
    private var newsList = [NewsModel]()
    var viewModel: DetailDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.setupViewModel()
    }

    func setupUI() {
        navigationController?.setCustomStyle()
        tableView.hideEmptyCells()
        tableView.reloadData()
        tableView.separatorStyle = .none
    }

    func setupViewModel() {
        viewModel.newsList
        .asDriver(onErrorJustReturn: [])
            .drive(onNext: { [weak self] list in
                self?.newsList = list
                self?.tableView.reloadData()
            }).disposed(by: disposeBag)

        viewModel.title.bind(to: navigationItem.rx.title).disposed(by: disposeBag)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return newsList.count
        }
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as DetailsTableViewCell
            cell.configure(newsList[indexPath.row])
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ReadMoreTableViewCell
            cell.selectionStyle = .none
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1,
            let urlString = newsList[indexPath.row].url,
            let webUrl = URL(string: urlString) {
            presentSafariViewController(for: webUrl)
        }

    }

}
