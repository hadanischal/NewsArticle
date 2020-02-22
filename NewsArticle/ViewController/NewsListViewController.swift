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

final class NewsListViewController: UITableViewController {

    @IBOutlet weak var categoriesButton: UIBarButtonItem!
    @IBOutlet weak var sourcesButton: UIBarButtonItem!

    private let disposeBag = DisposeBag()
    private var newsList = [NewsModel]()
    var viewModel: NewsListViewModelProtocol?

    private let selectedNewsSubject = PublishSubject<NewsModel>()
    var selectedNews: Observable<NewsModel> {
        return selectedNewsSubject.asObserver()
    }

    convenience init(datasource: NewsListViewModelProtocol = NewsListViewModel()) {
        self.init()
        viewModel = datasource
    }

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
        guard let viewModel = viewModel else {
            return
        }

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

        let categoriesButtonTap = categoriesButton.rx.tap.asObservable()
        let sourcesButtonTap = sourcesButton.rx.tap.asObservable()

        viewModel.getRoute(withCategoriesButtonTap: categoriesButtonTap,
                           withSourcesButtonTap: sourcesButtonTap,
                           withNewsListdidSelectRow: selectedNews)

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
        self.selectedNewsSubject.onNext(newsList[indexPath.row])
    }
}
