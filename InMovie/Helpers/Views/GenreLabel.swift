//
//  GenreLabel.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-08.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import UIKit

class GenreLabel: UILabel {
    
    var topInset: CGFloat = 3.0
    var bottomInset: CGFloat = 5.0
    var leftInset: CGFloat = 3.0
    var rightInset: CGFloat = 5.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }
}
