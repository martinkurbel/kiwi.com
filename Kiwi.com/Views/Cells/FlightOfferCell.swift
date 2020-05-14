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
    
    private let priceLabel = KILabel(style: .semibold, size: 22, align: .right)
    private let fromLabels = TwoLabelsView()
    private let arrowIcon = UIImageView()
    private let durationLabel = KILabel(size: 14)
    private let toLabels = TwoLabelsView()
    
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
        
        self.addSubview(fromLabels)
        fromLabels.noAutoresizingMask()
        NSLayoutConstraint.activate([
            fromLabels.leftAnchor.constraint(equalTo: self.leftAnchor),
            fromLabels.topAnchor.constraint(equalTo: coverView.bottomAnchor, constant: Sizes.offset)
        ])
        
        arrowIcon.image = UIImage(named: "arrowDown")
        self.addSubview(arrowIcon)
        arrowIcon.noAutoresizingMask()
        NSLayoutConstraint.activate([
            arrowIcon.widthAnchor.constraint(equalToConstant: 16),
            arrowIcon.heightAnchor.constraint(equalToConstant: 24),
            arrowIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Sizes.offset),
            arrowIcon.topAnchor.constraint(equalTo: fromLabels.bottomAnchor, constant: Sizes.offset)
        ])
        
        self.addSubview(durationLabel)
        durationLabel.noAutoresizingMask()
        NSLayoutConstraint.activate([
            durationLabel.leftAnchor.constraint(equalTo: arrowIcon.rightAnchor, constant: Sizes.offset),
            durationLabel.topAnchor.constraint(equalTo: fromLabels.bottomAnchor, constant: 20),
        ])
        
        self.addSubview(toLabels)
        toLabels.noAutoresizingMask()
        NSLayoutConstraint.activate([
            toLabels.leftAnchor.constraint(equalTo: self.leftAnchor),
            toLabels.rightAnchor.constraint(equalTo: self.rightAnchor),
            toLabels.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: Sizes.offset)
        ])
        
        self.addSubview(priceLabel)
        priceLabel.noAutoresizingMask()
        NSLayoutConstraint.activate([
            priceLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 88),
            priceLabel.leftAnchor.constraint(equalTo: fromLabels.rightAnchor, constant: Sizes.offset),
            priceLabel.topAnchor.constraint(equalTo: coverView.bottomAnchor, constant: Sizes.offset),
            priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -Sizes.offset),
        ])
    }
    
    private func setupContet() {
        
        guard let flight = flight else { return }
        
        coverView.flight = flight
        
        //Fix me
        priceLabel.text = flight.totalPrice
        fromLabels.firstText = "\(flight.cityFrom) - \(flight.flyFrom)"
        fromLabels.secondText = flight.dDateAndTime
        toLabels.firstText = "\(flight.cityTo) - \(flight.flyTo)"
        toLabels.secondText = flight.aDateAndTime
        durationLabel.text = "\(flight.flyDuration) - \(flight.route.count)"
    }
}
