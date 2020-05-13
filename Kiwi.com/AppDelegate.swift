//
//  AppDelegate.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 07/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Init AppContext
        let _ = AppContext()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = ViewController()
        let nc = UINavigationController(rootViewController: vc)
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
        
        return true
    }
}

