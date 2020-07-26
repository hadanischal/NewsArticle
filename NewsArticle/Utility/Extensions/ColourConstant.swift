//
//  ColourConstant.swift
//  NewsArticle
//
//  Created by Nischal Hada on 22/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import UIKit

extension UIColor {
    static var primary: UIColor { ColorName.primary.color }

    static var viewBackgroundColor: UIColor { Asset.ColorsAssets.viewBackgroundColor.color }

    static var tableViewBackgroundColor: UIColor { Asset.ColorsAssets.viewBackgroundColor.color }

    static var titleColor: UIColor { Asset.ColorsAssets.titleColor.color }

    static var descriptionColor: UIColor { Asset.ColorsAssets.descriptionColor.color }

    static var barTintColor: UIColor { UIColor.primary }

    static var titleTintColor: UIColor { UIColor.white }
}
