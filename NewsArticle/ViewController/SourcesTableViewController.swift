//
//  SourcesTableViewController.swift
//  NewsArticle
//
//  Created by Nischal Hada on 31/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SourcesTableViewController: UITableViewController {

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    private var viewModel: SourcesDataSource!
    private var sourceModelList: [SourceModel]!

    private let selectedCategoriesSubject = PublishSubject<String>()
    var selectedCategories: Observable<String>? {
        return selectedCategoriesSubject.asObserver()
    }

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupViewModel()
    }

    func setUpUI() {
        title = "Select Sources"
        view.backgroundColor = UIColor.viewBackgroundColor
        tableView.backgroundColor = UIColor.tableViewBackgroundColor
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        navigationController?.setCustomStyle()

        cancelButton.rx.tap.subscribe(onNext: { [weak self] in
            self?.dismiss(animated: true)
        }).disposed(by: disposeBag)

    }

    func setupViewModel() {

        self.viewModel = SourcesViewModel()

        viewModel.newsList
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] list in
                self?.sourceModelList = list
                self?.tableView.reloadData()
            }, onError: { [weak self] error in
                self?.showAlertView(withTitle: "error", andMessage: error.localizedDescription)
            }).disposed(by: disposeBag)
        viewModel.getSources()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceModelList?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SourcesTableViewCell", for: indexPath) as? SourcesTableViewCell else {
            fatalError("SourcesTableViewCell does not exist")
        }
        cell.sourcesInfo = self.sourceModelList[indexPath.row]
        return cell
    }

}
