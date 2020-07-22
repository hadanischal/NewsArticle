//
//  NavigationControllerExtension.swift
//  NewsArticle
//
//  Created by Nischal Hada on 22/7/20.
//  Copyright © 2020 NischalHada. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
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
        // To tint the bar's items
        navigationBar.tintColor = .titleTintColor
        // To tint the bar's background
        navigationBar.barTintColor = .barTintColor

        navigationBar.titleTextAttributes = [.font: UIFont.navigationBarTitle,
                                             .foregroundColor: UIColor.titleTintColor]

        let attributes = [NSAttributedString.Key.font: UIFont.navigationBarButtonItem]

        UIBarButtonItem
            .appearance()
            .setTitleTextAttributes(attributes,
                                    for: UIControl.State.normal)

        view.backgroundColor = .barTintColor
        navigationBar.barStyle = .black
        navigationBar.prefersLargeTitles = false
        configureBackIndicatorImage()
    }

    func configureNavigationBar() {
        navigationBar.barTintColor = UIColor.white
        navigationBar.isTranslucent = false
        navigationBar.tintColor = UIColor.black
        let attributes = [
            NSAttributedString.Key.font: UIFont.navigationBarTitle,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        navigationBar.titleTextAttributes = attributes

        let buttonAttributes = [NSAttributedString.Key.font: UIFont.navigationBarButtonItem]

        UIBarButtonItem
            .appearance()
            .setTitleTextAttributes(buttonAttributes,
                                    for: UIControl.State.normal)
        configureBackIndicatorImage()
    }

    func hideNavigationBar() {
        navigationBar.isHidden = true
    }

    private func configureBackIndicatorImage() {
        navigationBar.backIndicatorImage = Asset.Icons.iconArrowBack.image
        navigationBar.backIndicatorTransitionMaskImage = Asset.Icons.iconArrowBack.image
        navigationBar.backItem?.title = ""
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }

    var backBarButtton: UIBarButtonItem {
        return UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
