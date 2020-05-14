//
//  FlightOfferCell.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 11/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import UIKit

class FlightOfferCell: UICollectionViewCell {
    
    struct Sizes {
        static let offset: CGFloat = 16
    }
    
    var flight: Flight? = nil {
        didSet {
            setupContet()
        }
    }
    
    private let coverView = CoverImageView()
    
    private let titleLabel = KILabel(style: .semibold ,size: 22)
    private let priceLabel = KILabel(style: .semibold, size: 22, align: .right)
    private let descriptionLabel = KILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        self.addSubview(coverView)
        coverView.noAutoresizingMask()
        NSLayoutConstraint.activate([
            coverView.leftAnchor.constraint(equalTo: self.leftAnchor),
            coverView.topAnchor.constraint(equalTo: self.topAnchor),
            coverView.rightAnchor.constraint(equalTo: self.rightAnchor),
            coverView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3)
        ])
        
        self.addSubview(titleLabel)
        titleLabel.noAutoresizingMask()
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Sizes.offset),
            titleLabel.topAnchor.constraint(equalTo: coverView.bottomAnchor, constant: 32)
        ])
        
        self.addSubview(priceLabel)
        priceLabel.noAutoresizingMask()
        NSLayoutConstraint.activate([
            priceLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 88),
            priceLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: Sizes.offset),
            priceLabel.topAnchor.constraint(equalTo: coverView.bottomAnchor, constant: 32),
            priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -Sizes.offset),
        ])
        
        self.addSubview(descriptionLabel)
        descriptionLabel.noAutoresizingMask()
        NSLayoutConstraint.activate([
            descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Sizes.offset),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Sizes.offset),
            descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -Sizes.offset),
        ])
    }
    
    private func setupContet() {
        
        guard let flight = flight else { return }
        
        coverView.flight = flight
        
        //Fix me
        priceLabel.text = "\(flight.price) €"
        titleLabel.text = "\(flight.cityFrom) - \(flight.cityTo)"
        descriptionLabel.text = "Duration: \(flight.flyDuration), \(flight.flyDate)"
    }
}
