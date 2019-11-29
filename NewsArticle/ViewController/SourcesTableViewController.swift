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
    @IBOutlet weak var doneButton: UIBarButtonItem!
    private var viewModel: SourcesDataSource!
    private var sourceModelList: [SourceModel]!

    private let selectedSourceSubject = PublishSubject<SourceModel>()
    var selectedSource: Observable<SourceModel>? {
        return selectedSourceSubject.asObserver()
    }

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupViewModel()
    }

    func setUpUI() {
        view.backgroundColor = UIColor.viewBackgroundColor
        tableView.backgroundColor = UIColor.tableViewBackgroundColor
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        navigationController?.setCustomStyle()

        cancelButton.rx.tap.subscribe(onNext: { [weak self] in
            self?.dismiss(animated: true)
        }).disposed(by: disposeBag)

        doneButton.rx.tap.subscribe(onNext: { [weak self] in
            let selectedIndexPath = self?.tableView.indexPathForSelectedRow
            if
                let row = selectedIndexPath?.row,
                let selectedValue = self?.sourceModelList?[row] {
                self?.selectedSourceSubject.onNext(selectedValue)
                self?.dismiss(animated: true)
            } else {
                self?.showAlertView(withTitle: "Unable to get selected category", andMessage: "Please select the category")
            }
        }).disposed(by: disposeBag)

    }

    func setupViewModel() {

        self.viewModel = SourcesViewModel()
        viewModel.title.bind(to: self.navigationItem.rx.title).disposed(by: disposeBag)

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
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SourcesTableViewCell
        cell.configure(self.sourceModelList[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
}
