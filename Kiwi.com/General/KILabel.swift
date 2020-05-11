//
//  KILabel.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 11/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import UIKit

class KILabel: UILabel {
    
    convenience init(style: UIFont.Weight = .regular,
                     size: CGFloat = 15,
                     color: UIColor = .black,
                     align: NSTextAlignment = .left,
                     lines: Int = 1,
                     scale: CGFloat = 1) {
        self.init()

        self.font = UIFont.systemFont(ofSize: size, weight: style)
        self.textColor = color
        self.textAlignment = align
        self.numberOfLines = lines
        self.lineBreakMode = lines == 1 ? .byTruncatingTail : .byWordWrapping
        self.minimumScaleFactor = scale
        self.adjustsFontSizeToFitWidth = scale != 1
    }
}
