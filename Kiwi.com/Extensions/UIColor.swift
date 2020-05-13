//
//  UIColor.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 13/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgbColor(_ red: Int, _ green: Int, _ blue: Int, _ alpha: CGFloat = 1) -> UIColor {
        return UIColor(
            red:    CGFloat(red)/255.0,
            green:  CGFloat(green)/255.0,
            blue:   CGFloat(blue)/255.0,
            alpha: alpha
        )
    }
}
