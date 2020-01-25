//
//  EXNavigationController.swift
//  modalTeste
//
//  Created by Weslley Madeira on 25/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {

    func applyBarStyle() {
        navigationBar.barTintColor = UIColor(named: "BackgroundNavigation")
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIColor.blackColorNavigation.asOnePointImage(), for: .default)
        navigationBar.tintColor = UIColor(named: "BackgroundNavigation")
        navigationBar.isTranslucent = false
        navigationBar.tintColor = UIColor.whiteColor
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationBar.topItem?.backBarButtonItem = backButton
    }
    

    func configTitleTextWhite() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.whiteColor]
        navigationBar.titleTextAttributes = textAttributes
    }
    
    open override var childForStatusBarStyle: UIViewController? {
           return visibleViewController
    }
    
    
}
