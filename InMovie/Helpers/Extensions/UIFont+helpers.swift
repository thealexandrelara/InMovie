//
//  UIFont+helpers.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-07.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import UIKit

extension UIFont {
    public class func overrideSystemFont(ofSize:CGFloat, weight: UIFont.Weight = UIFont.Weight.regular) -> UIFont {
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        var fontName = "Lato-Regular"
        
        switch weight {
        case UIFont.Weight.regular:
            fontName = "Lato-Regular"
        case UIFont.Weight.bold:
            fontName = "Lato-Bold"
        default:
            fontName = "Lato-Regular"
        }
        
        switch height {
        case 480.0: //Iphone 3,4,SE => 3.5 inch
            return UIFont(name: fontName, size: ofSize*0.7)!
        case 568.0: //iphone 5, 5s => 4 inch
            return UIFont(name: fontName, size: ofSize*0.8)!
        case 667.0: //iphone 6, 6s => 4.7 inch
            return UIFont(name: fontName, size: ofSize)!
        case 736.0: //iphone 6s+ 6+ => 5.5 inch
            return UIFont(name: fontName, size: ofSize*1.1)!
        default:
            return UIFont(name: fontName, size: ofSize)!
        }
    }
}
