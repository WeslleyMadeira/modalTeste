//
//  EXColor.swift
//  modalTeste
//
//  Created by Weslley Madeira on 25/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    public class var blackColorNavigation: UIColor { return UIColor(named: "color_navigation")! }
    public class var whiteColor: UIColor { return UIColor(named: "color_white")! }
    public class var backgroundColor: UIColor { return UIColor(named: "color_background")! }
    public class var barGrayColor: UIColor { return UIColor(named: "color_gray_bar")! }
    public class var barGrayBoldColor: UIColor { return UIColor(named: "color_gray_bold")! }
    
    
    
    func asOnePointImage() -> UIImage? {
           UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
           let context = UIGraphicsGetCurrentContext()
           setFill()
           context?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
           let image = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
           return image
    }
}
