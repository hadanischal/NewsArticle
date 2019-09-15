//
//  CategoriesTableViewController.swift
//  NewsArticle
//
//  Created by Nischal Hada on 24/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CategoriesTableViewController: UITableViewController {

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    var viewModel: CategoriesDataSource!
    private var categoriesList: [String]?
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupViewModel()
    }

    func setUpUI() {
        title = "Select Categories"
        view.backgroundColor = UIColor.viewBackgroundColor
        tableView.backgroundColor = UIColor.tableViewBackgroundColor
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        navigationController?.setCustomStyle()
    }

    func setupViewModel() {

        viewModel.getCategories()
            .asDriver(onErrorJustReturn: CategoriesModel(categories: nil))
            .drive(onNext: { [weak self] result in
                if let list = result.categories {
                    self?.categoriesList = list
                    self?.tableView.reloadData()
                }
            })
            .disposed(by: disposeBag)

        cancelButton.rx.tap.subscribe(onNext: { [weak self] in
            self?.dismiss(animated: true)
        }).disposed(by: disposeBag)

        doneButton.rx.tap
            .flatMapLatest { [weak self] _ -> Observable<String> in
                if
                    let row = self?.tableView.indexPathForSelectedRow?.row,
                    let selectedValue = self?.categoriesList?[row] {
                    return Observable.just(selectedValue)
                }
                return Observable.error(RxError.noElements)
            }.subscribe(onNext: { [weak self] category in
                self?.viewModel.updateNews(withCategory: category)
                self?.dismiss(animated: true)
                }, onError: { [weak self] _ in
                    self?.showAlertView(withTitle: "Unable to get selected category", andMessage: "Please select the category")
            })
            .disposed(by: disposeBag)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesList?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath)
        cell.textLabel?.text = categoriesList?[indexPath.row]
        cell.textLabel?.font = .body2
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
