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
    var viewModel: SourcesDataSource!
    private var sourceModelList: [SourceModel]!
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
    }

    func setupViewModel() {
        viewModel.title.bind(to: self.navigationItem.rx.title).disposed(by: disposeBag)

        viewModel.newsList
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] list in
                self?.sourceModelList = list
                self?.tableView.reloadData()
            }, onError: { [weak self] error in
                self?.showAlertView(withTitle: "error", andMessage: error.localizedDescription)
            }).disposed(by: disposeBag)

        cancelButton.rx.tap.subscribe(onNext: { [weak self] in
            self?.dismiss(animated: true)
        }).disposed(by: disposeBag)

        doneButton.rx.tap
            .flatMapLatest { [weak self] _ -> Observable<SourceModel> in
                if
                    let row = self?.tableView.indexPathForSelectedRow?.row,
                    let selectedValue = self?.sourceModelList?[row] {
                    return Observable.just(selectedValue)
                }
                return Observable.error(RxError.noElements)
            }.subscribe(onNext: { [weak self] sourceModel in
                self?.viewModel.updateNews(withSource: sourceModel)
                self?.dismiss(animated: true)
                }, onError: { [weak self] _ in
                    self?.showAlertView(withTitle: "Unable to get selected source", andMessage: "Please select the source")
            })
            .disposed(by: disposeBag)
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
