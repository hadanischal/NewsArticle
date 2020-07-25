//
//  SourcesTableViewCell.swift
//  NewsArticle
//
//  Created by Nischal Hada on 24/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import UIKit

class SourcesTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .viewBackgroundColor
        titleLabel.font = .body2
        descriptionLabel.font = .body3
        titleLabel?.textColor = .titleColor
        descriptionLabel?.textColor = .descriptionColor
    }

    func configure(_ data: SourcesDTO) {
        titleLabel.text = data.name
        descriptionLabel.text = data.description
    }
}
