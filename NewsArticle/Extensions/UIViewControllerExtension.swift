//
//  UIViewControllerExtension.swift
//  NewsArticle
//
//  Created by Nischal Hada on 7/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SafariServices

extension UIViewController {
    public func alert(title: String?,
                      message: String? = nil,
                      actions: [AlertAction],
                      preferredStyle: UIAlertController.Style = .alert,
                      vc: UIViewController) -> Observable<Int> {

        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)

        return actionSheet.addAction(actions: actions)
            .do(onSubscribed: {
                vc.present(actionSheet, animated: true, completion: nil)
            })
    }
}

extension UIViewController {
    func showAlertView(withTitle title: String?, andMessage message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) -> Void in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIViewController {

    func presentSafariViewController(for url: URL) {
        let safariController = SFSafariViewController(url: url)
        if #available(iOS 10, *) {
            safariController.preferredControlTintColor = .barTintColor
        } else {
            safariController.view.tintColor = .barTintColor
        }
        safariController.preferredBarTintColor = .white
        safariController.modalPresentationStyle = .overFullScreen

        present(safariController, animated: true, completion: nil)
    }
}

//let safariVC = SFSafariViewController(url: privacyPolicyUrl)
//safariVC.preferredControlTintColor = .barTintColor
//safariVC.preferredBarTintColor = .white
//self.present(safariVC, animated: true, completion: nil)
//
