//
//  UiViewExtension.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 06/06/23.
//

import UIKit

extension UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func applyGradient() {
            let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [R.color.buttongradient1, R.color.buttonGradient2]
            gradientLayer.cornerRadius = layer.cornerRadius

            gradientLayer.frame = self.bounds
            self.layer.addSublayer(gradientLayer)
        }
    
    func addBorderAndColor(color: UIColor, width: CGFloat, corner_radius: CGFloat = 0, clipsToBounds: Bool = false) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = corner_radius
        self.clipsToBounds = clipsToBounds
    }
    
}
