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
    
    private let coverImage = UIImageView()
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
        
        titleLabel.text = "Berlin"
        
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Sizes.offset),
            titleLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 32)
        ])
        
        priceLabel.text = "100.00€"
        
        self.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 88),
            priceLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: Sizes.offset),
            priceLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 32),
            priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -Sizes.offset),
        ])
        
        descriptionLabel.text = "Aasaf asfjaf asfjajsf ajf ajsf ajfsf afj asfja fs"
        
        self.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Sizes.offset),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Sizes.offset),
            descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -Sizes.offset),
        ])
    }
    
    private func setupContet() {
        
        guard let flight = flight else { return }
        
        //Fix me
        priceLabel.text = "\(flight.price) €"
        titleLabel.text = flight.cityTo
        descriptionLabel.text = "Duration: \(flight.duration.total)"
    }
}
