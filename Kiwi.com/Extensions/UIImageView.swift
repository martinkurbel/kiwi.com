//
//  UIImageView.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 13/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// Load image from url
    func load(url: URL) {
        weak var welf = self
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        welf?.image = image
                    }
                }
            }
        }
    }
    
    /// Load image from url and save it cach
    func loadCashed(url: URL) {
        
        let cache = AppContext.shared.imageCache
        
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) as? UIImage {
            self.image = cachedImage
        } else {
            
            weak var welf = self
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            welf?.image = image
                            if let imageToCache = UIImage(data: data) {
                                cache.setObject(imageToCache, forKey: url.absoluteString as NSString)
                            }
                        }
                    }
                }
            }
        }
    }
    
}
