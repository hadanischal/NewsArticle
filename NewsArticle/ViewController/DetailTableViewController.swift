//
//  DetailTableViewController.swift
//  NewsArticle
//
//  Created by Nischal Hada on 21/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit
import SafariServices

class DetailTableViewController: UITableViewController {
    
    var newsInfo: NewsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func setupUI() {
        title = newsInfo.title
        navigationController?.setCustomStyle()
        tableView.hideEmptyCells()
        tableView.reloadData()
        tableView.separatorStyle = .none
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as? DetailsTableViewCell else {
                fatalError("DetailsTableViewCell does not exist")
            }
            cell.newsInfo = newsInfo
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReadMoreTableViewCell", for: indexPath) as? ReadMoreTableViewCell else {
                fatalError("DetailsTableViewCell does not exist")
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1,
            let urlString = newsInfo.url {
            displayPrivacyPolicy(withUrl: urlString)
        }

    }
    
    private func displayPrivacyPolicy(withUrl urlString: String) {
        
        guard let privacyPolicyUrl = URL(string: urlString) else {
            return
        }
        
        let safariVC = SFSafariViewController(url: privacyPolicyUrl)
        safariVC.preferredControlTintColor = .barTintColor
        safariVC.preferredBarTintColor = .white
        self.present(safariVC, animated: true, completion: nil)
    }
    
}
