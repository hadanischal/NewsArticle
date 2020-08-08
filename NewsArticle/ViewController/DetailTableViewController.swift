//
//  DetailTableViewController.swift
//  NewsArticle
//
//  Created by Nischal Hada on 21/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

final class DetailTableViewController: UITableViewController {
    @IBOutlet var readMoreButton: UIButton!
    private var viewModel: DetailDataSource!

    convenience init(withDataSource dataSource: DetailDataSource) {
        self.init()
        self.viewModel = dataSource
    }

    static func detailTableVC(_ newsInfo: NewsListDTO) -> DetailTableViewController {
        let viewController = StoryboardScene.Main.detailTableViewController.instantiate()
        viewController.viewModel = DetailViewModel(withNewsModel: newsInfo)
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        configureTableView()
    }

    private func setUpUI() {
        navigationItem.title = viewModel.title
        navigationItem.backBarButtonItem = navigationController?.backBarButtton
        navigationController?.setCustomStyle()
        readMoreButton.titleLabel?.font = UIFont.heading2
        readMoreButton.titleLabel?.textColor = UIColor.primary
    }

    private func configureTableView() {
        tableView?.backgroundColor = UIColor.viewBackgroundColor
        tableView.register(DetailsTableViewCell.self)
        view.backgroundColor = UIColor.viewBackgroundColor
    }

    @IBAction func actionReadMore(_ sender: UIButton) {
        if let webUrl = URL(string: viewModel.infoForRowAt(0).url) {
            presentSafariViewController(for: webUrl)
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
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as DetailsTableViewCell
        let data = viewModel.infoForRowAt(indexPath.row)
        cell.configure(data)
        cell.selectionStyle = .none
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
