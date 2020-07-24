//
//  ReusableView.swift
//  NewsArticle
//
//  Created by Nischal Hada on 24/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import UIKit

protocol ReusableView: AnyObject {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}

extension UICollectionViewCell: ReusableView {}
