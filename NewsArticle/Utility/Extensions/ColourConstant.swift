//
//  ColourConstant.swift
//  NewsArticle
//
//  Created by Nischal Hada on 22/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import UIKit

extension UIColor {
    static var primary: UIColor {
        return ColorName.primary.color
    }

    static var viewBackgroundColor: UIColor {
        return Asset.ColorsAssets.viewBackgroundColor.color
    }

    static var tableViewBackgroundColor: UIColor {
        return Asset.ColorsAssets.viewBackgroundColor.color
    }

    static var titleColor: UIColor {
        return Asset.ColorsAssets.titleColor.color
    }

    static var descriptionColor: UIColor {
        return Asset.ColorsAssets.descriptionColor.color
    }

    static var barTintColor: UIColor {
        return ColorName.primary.color
    }

    static var titleTintColor: UIColor {
        return UIColor.white
    }
}
