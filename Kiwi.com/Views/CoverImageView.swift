//
//  CoverImageView.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 13/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import UIKit

class CoverImageView: UIView {
    
    var flight: Flight? = nil {
        didSet {
            setupContet()
        }
    }
    
    private let coverImage = UIImageView()
    private let gradientView = GradientView()
    private let destinationLabel = KILabel(style: .bold ,size: 34, color: .white, scale: 0.8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        coverImage.contentMode = .scaleToFill
        coverImage.backgroundColor = .gray
        coverImage.image = UIImage(named: "defaultImage")
        
        self.addSubview(coverImage)
        coverImage.noAutoresizingMask()
        coverImage.pinEdges(to: self)
        
        gradientView.from = .clear
        gradientView.to = UIColor.black.withAlphaComponent(0.6)
        
        coverImage.addSubview(gradientView)
        gradientView.noAutoresizingMask()
        NSLayoutConstraint.activate([
            gradientView.heightAnchor.constraint(equalToConstant: 80),
            gradientView.leftAnchor.constraint(equalTo: coverImage.leftAnchor),
            gradientView.rightAnchor.constraint(equalTo: coverImage.rightAnchor),
            gradientView.bottomAnchor.constraint(equalTo: coverImage.bottomAnchor)
        ])
        
        coverImage.addSubview(destinationLabel)
        destinationLabel.noAutoresizingMask()
        NSLayoutConstraint.activate([
            destinationLabel.leftAnchor.constraint(equalTo: coverImage.leftAnchor, constant: 8),
            destinationLabel.rightAnchor.constraint(equalTo: coverImage.rightAnchor, constant: -8),
            destinationLabel.bottomAnchor.constraint(equalTo: coverImage.bottomAnchor)
        ])
    }
    
    private func setupContet() {
        
        guard let flight = flight else { return }
        
        destinationLabel.text = flight.cityTo
        
        if let url = URL(string: "https://images.kiwi.com/photos/600x600/\(flight.mapIdto).jpg") {
            coverImage.loadCashed(url: url)
        }
    }
}
