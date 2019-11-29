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

    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.font = .body2
        self.descriptionLabel.font = .body3
    }

    func configure(_ sourcesInfo: SourceModel?) {
        guard let data = sourcesInfo else { return }
        titleLabel.text = data.name?.withoutHtml
        descriptionLabel.text = data.description?.withoutHtml
    }
}
