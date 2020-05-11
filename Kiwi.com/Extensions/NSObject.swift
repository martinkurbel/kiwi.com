//
//  NSObject.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 11/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import Foundation

extension NSObject {
    
    public class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? String.init(describing: type(of: self))
    }
    
    public var className: String {
        return type(of: self).className
    }
}
