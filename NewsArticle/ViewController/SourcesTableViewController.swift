//
//  SourcesTableViewController.swift
//  NewsArticle
//
//  Created by Nischal Hada on 31/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

final class SourcesTableViewController: UITableViewController, BaseViewProtocol {
    @IBOutlet var cancelButton: UIBarButtonItem!
    @IBOutlet var doneButton: UIBarButtonItem!

    private let selectedSourceSubject = PublishSubject<SourcesDTO>()
    var selectedSource: Observable<SourcesDTO> { selectedSourceSubject.asObserver() }

    private var viewModel: SourcesDataSource!
    private let disposeBag = DisposeBag()

    convenience init(withDataSource dataSource: SourcesDataSource) {
        self.init()
        self.viewModel = dataSource
    }

    static func sourcesTableVC() -> SourcesTableViewController {
        let viewController = StoryboardScene.Main.sourcesTableViewController.instantiate()
        viewController.viewModel = SourcesViewModel()
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
        tableView.register(SourcesTableViewCell.self)
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

            selectedSourceSubject.onNext(data)
            dismiss(animated: true)

        } else {
            showAlertView(withTitle: L10n.DashBoard.sourceNotFoundTitle, andMessage: L10n.DashBoard.sourceNotFoundMessage)
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
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SourcesTableViewCell
        let data = viewModel.infoForRowAt(indexPath.row)
        cell.configure(data)
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
