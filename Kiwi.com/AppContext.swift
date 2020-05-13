//
//  AppContext.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 13/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import Foundation

class AppContext {
    
    static let shared = AppContext()
    
    let api = FlightsApi()
    
    let imageCache = NSCache<NSString, AnyObject>()
}
