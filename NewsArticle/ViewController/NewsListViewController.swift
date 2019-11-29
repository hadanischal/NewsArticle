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
        self.setupUI()
        self.setupViewModel()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func setupUI() {
        self.title = "News"
        self.navigationController?.setCustomStyle()
        self.tableView.hideEmptyCells()
    }

    func setupViewModel() {
        viewModel.title.bind(to: navigationItem.rx.title).disposed(by: disposeBag)
        viewModel.newsList
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] chores in
                self?.newsList = chores
                self?.tableView.reloadData()
                }, onError: { error in
                    self.showAlertView(withTitle: "error", andMessage: error.localizedDescription)
            })
            .disposed(by: disposeBag)

//        viewModel.getTopHeadlines(withParameter: nil)

    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as NewsTableViewCell
        cell.configure(self.newsList[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueDetails", sender: indexPath)
    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "segueDetails" {

            guard let detailVC = segue.destination as? DetailTableViewController else {
                fatalError("Segue destination is not found")
            }
            guard let indexPath = sender as? IndexPath else {
                fatalError("indexPath not found")
            }
            detailVC.newsInfo = newsList[indexPath.row]

        } else if segue.identifier == "segueCategories" {
            guard let navC = segue.destination as? UINavigationController,
                let categoryVC = navC.viewControllers.first as? CategoriesTableViewController else {
                    fatalError("Segue destination is not found")
            }

            categoryVC.selectedCategories?.asDriver(onErrorJustReturn: "")
                .drive(onNext: { [weak self] category in
                    self?.viewModel.updateNews(withCategory: category)
                }).disposed(by: disposeBag)

        } else if segue.identifier == "segueSources" {
            guard let navC = segue.destination as? UINavigationController,
                let sourcesVC = navC.viewControllers.first as? SourcesTableViewController else {
                    fatalError("Segue destination is not found")
            }
            sourcesVC.selectedSource?
                .subscribe(onNext: { [weak self] source in
                    self?.viewModel.updateNews(withSource: source)
                }).disposed(by: disposeBag)
        }

    }
}
