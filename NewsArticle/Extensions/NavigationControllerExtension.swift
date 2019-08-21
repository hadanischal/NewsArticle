//
//  NavigationControllerExtension.swift
//  NewsArticle
//
//  Created by Nischal Hada on 11/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomStyle()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UINavigationController {
    func setCustomStyle() {
        navigationBar.isTranslucent = false
        //To tint the bar's items
        navigationBar.tintColor = .titleTintColor
        //To tint the bar's background
        navigationBar.barTintColor = .barTintColor
//        navigationItem.hidesBackButton = true

        navigationBar.titleTextAttributes = [.font: UIFont.navigationBarTitle,
                                             .foregroundColor: UIColor.titleTintColor]

        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.navigationBarButtonItem], for: UIControl.State.normal)

        view.backgroundColor = .barTintColor
        navigationBar.barStyle = .black

    }
}
