//
//  NewsTableViewCell.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/10/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
//        self.contentView.backgroundColor = .viewBackgroundColor
        self.titleLabel.font = .body1
        self.descriptionLabel.font = .body2
    }
}
