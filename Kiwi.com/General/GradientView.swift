//
//  GradientView.swift
//  Kiwi.com
//
//  Created by Martin Kurbel on 13/05/2020.
//  Copyright © 2020 Martin Kurbel. All rights reserved.
//

import UIKit

class GradientView: UIView {

    private let gradientLayer = CAGradientLayer()

    var from = UIColor.white {
        didSet {
            updateGLayer()
        }
    }

    var to = UIColor.white.withAlphaComponent(0) {
        didSet {
            updateGLayer()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialize() {
        self.clipsToBounds = true
        self.layer.addSublayer(gradientLayer)
        updateGLayer()
    }

    private func updateGLayer() {
        gradientLayer.colors = [self.from.cgColor, self.to.cgColor]
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        gradientLayer.frame = self.bounds
        CATransaction.commit()
    }
}
