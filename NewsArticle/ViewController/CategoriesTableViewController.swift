//
//  CategoriesTableViewController.swift
//  NewsArticle
//
//  Created by Nischal Hada on 24/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

final class CategoriesTableViewController: UITableViewController, BaseViewProtocol {
    @IBOutlet var cancelButton: UIBarButtonItem!
    @IBOutlet var doneButton: UIBarButtonItem!

    private let selectedCategoriesSubject = PublishSubject<String>()
    var selectedCategories: Observable<String> { selectedCategoriesSubject.asObserver() }

    private var viewModel: CategoriesDataSource!
    private let disposeBag = DisposeBag()

    convenience init(withDataSource dataSource: CategoriesDataSource) {
        self.init()
        self.viewModel = dataSource
    }

    static func categoriesTableVC() -> CategoriesTableViewController {
        let viewController = StoryboardScene.Main.categoriesTableViewController.instantiate()
        viewController.viewModel = CategoriesViewModel()
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        configureTableView()
        setupViewModel()
    }

    private func setUpUI() {
        navigationItem.title = viewModel.title
        navigationItem.backBarButtonItem = navigationController?.backBarButtton
        navigationController?.setCustomStyle()
    }

    private func configureTableView() {
        tableView?.backgroundColor = UIColor.viewBackgroundColor
        view.backgroundColor = UIColor.viewBackgroundColor
        tableView.register(CategoriesTableViewCell.self)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    private func setupViewModel() {
        viewModel.updateInfo
            .asDriver(onErrorJustReturn: false)
            .drive(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            }).disposed(by: disposeBag)

        viewModel.errorResult
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] error in
                self?.showAlertView(withTitle: error.localizedDescription, andMessage: error.localizedDescription)
            }).disposed(by: disposeBag)

        viewModel.isLoading.bind(to: isAnimating).disposed(by: disposeBag)

        viewModel.viewDidLoad()
    }

    @IBAction func actionCancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }

    @IBAction func actionDone(_ sender: UIBarButtonItem) {
        if
            let indexPath = tableView.indexPathForSelectedRow {
            let data = viewModel.infoForRowAt(indexPath.row)
            selectedCategoriesSubject.onNext(data)
            dismiss(animated: true)

        } else {
            showAlertView(withTitle: L10n.DashBoard.categoriesNotFoundTitle, andMessage: L10n.DashBoard.categoriesNotFoundMessage)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as CategoriesTableViewCell
        let data = viewModel.infoForRowAt(indexPath.row)
        cell.textLabel?.text = data
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
