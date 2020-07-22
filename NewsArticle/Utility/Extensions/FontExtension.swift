//
//  FontExtension.swift
//  NewsArticle
//
//  Created by Nischal Hada on 22/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import UIKit

extension UIFont {
    class func boldFont(size: CGFloat) -> UIFont {
        return UIFont(font: FontFamily.ApexRounded.heavy, size: size)
    }

    class func regularFont(size: CGFloat) -> UIFont {
        return UIFont(font: FontFamily.ApexRounded.medium, size: size)
    }

    class func lightFont(size: CGFloat) -> UIFont {
        return UIFont(font: FontFamily.ApexRounded.book, size: size)
    }

    class func kittenSwashFont(size: CGFloat) -> UIFont {
        return UIFont(font: FontFamily.KittenSwash.regular, size: size)
    }
}

extension UIFont {
    static var navigationBarTitle: UIFont {
        return .kittenSwashFont(size: 22)
    }

    static var navigationBarButtonItem: UIFont {
        return .lightFont(size: 20)
    }

    static var titleFont: UIFont {
        return .boldFont(size: 36)
    }

    static var descriptionFont: UIFont {
        return .regularFont(size: 14)
    }

    static var backgroundLabel: UIFont {
        return .kittenSwashFont(size: 34)
    }

    static var heading1: UIFont {
        return .regularFont(size: 25)
    }

    static var heading2: UIFont {
        return .boldFont(size: 25)
    }

    static var body1: UIFont {
        return .regularFont(size: 20)
    }

    static var body2: UIFont {
        return .lightFont(size: 20)
    }

    static var body3: UIFont {
        return .lightFont(size: 18)
    }

    static var detailTitle: UIFont {
        return .lightFont(size: 16)
    }

    static var detailBody: UIFont {
        return .regularFont(size: 24)
    }
}
