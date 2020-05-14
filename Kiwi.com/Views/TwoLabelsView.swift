//
//  TwoLabelsView.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 14/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import UIKit

class TwoLabelsView: UIView {
    
    struct Sizes {
        static let offset: CGFloat = 16
    }
    
    var firstText = "" {
        didSet { firstLabel.text = firstText }
    }
    
    var secondText = "" {
        didSet { secondLabel.text = secondText }
    }
    
    private let stackView = UIStackView()
    private let firstLabel = KILabel(size: 17)
    private let secondLabel = KILabel(color: .gray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        
        stackView.axis = .vertical
        stackView.addArrangedSubview(firstLabel)
        stackView.addArrangedSubview(secondLabel)
        
        self.addSubview(stackView)
        stackView.noAutoresizingMask()
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Sizes.offset),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Sizes.offset)
        ])
    }
}
