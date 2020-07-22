//
//  ImageViewExtension.swift
//  NewsArticle
//
//  Created by Nischal Hada on 22/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import Kingfisher
import UIKit

extension UIImageView {
    public func setImage(url: URL?) {
        self.kf.setImage(with: url, placeholder: Asset.Icons.placeholder.image)
    }
}
