//
//  CategoriesTableViewCell.swift
//  NewsArticle
//
//  Created by Nischal Hada on 24/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        textLabel?.font = .body1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
