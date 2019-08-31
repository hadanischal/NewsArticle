//
//  SourcesTableViewCell.swift
//  NewsArticle
//
//  Created by Nischal Hada on 31/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit

class SourcesTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var sourcesInfo: SourceModel? {
        didSet {
            guard let data = sourcesInfo else {
                return
            }
            titleLabel.text = data.name?.withoutHtml
            descriptionLabel.text = data.description?.withoutHtml
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.font = .body1
        self.descriptionLabel.font = .body2
    }
}
