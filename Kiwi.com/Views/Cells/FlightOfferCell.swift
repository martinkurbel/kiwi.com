//
//  FlightOfferCell.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 11/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import UIKit

class FlightOfferCell: UICollectionViewCell {
    
    private let coverImage = UIImageView()
    private let titleLabel = KILabel(size: 20)
    private let descriptionLabel = KILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        coverImage.contentMode = .scaleToFill
        coverImage.backgroundColor = .yellow
        
        self.addSubview(coverImage)
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coverImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            coverImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            coverImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            coverImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/2)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
