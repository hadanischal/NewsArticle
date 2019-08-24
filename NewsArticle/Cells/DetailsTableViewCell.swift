//
//  DetailsTableViewCell.swift
//  NewsArticle
//
//  Created by Nischal Hada on 21/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!

    var newsInfo: NewsModel? {
        didSet {
            guard let data = newsInfo else {
                return
            }
            titleLabel.text = data.title?.withoutHtml
            descriptionLabel.text = data.description?.withoutHtml
            if
                let urlString = data.urlToImage,
                let url = URL(string: urlString) {
                thumbnailImage.setImage(url: url)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        //self.contentView.backgroundColor = .viewBackgroundColor
        self.titleLabel.font = .body1
        self.descriptionLabel.font = .body2
    }

}
