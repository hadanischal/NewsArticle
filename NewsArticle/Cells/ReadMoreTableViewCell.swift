//
//  ReadMoreTableViewCell.swift
//  NewsArticle
//
//  Created by Nischal Hada on 21/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit

class ReadMoreTableViewCell: UITableViewCell {

    @IBOutlet weak var readMoreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.readMoreLabel.font = .heading2
//        self.readMoreLabel.backgroundColor = .barTintColor
    }

}
