//
//  DetailsTableViewCell.swift
//  NewsArticle
//
//  Created by Nischal Hada on 24/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var thumbnailImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.backgroundColor = .viewBackgroundColor
        titleLabel?.font = .body1
        descriptionLabel?.font = .body3
        titleLabel?.textColor = .titleColor
        descriptionLabel?.textColor = .descriptionColor
    }

    func configure(_ data: NewsListDTO) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        thumbnailImage.setImage(url: URL(string: data.urlToImage))
    }
}
