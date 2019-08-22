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
        viewModel.newsList
            .subscribe(onNext: { [weak self] chores in
                self?.newsList = chores
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            })
            .disposed(by: disposeBag)

        viewModel.populateNews()

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
        cell.newsInfo = self.newsList[indexPath.row]
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
        }
        
    }
}
