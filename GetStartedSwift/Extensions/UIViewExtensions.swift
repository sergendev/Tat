//
//  UIViewExtensions.swift
//  GetStartedSwift
//
//  Created by Sergen Gonenc on 9/7/19.
//  Copyright © 2019 Memucas. All rights reserved.
//

import Foundation

extension UIView {
    
    func addGradient(start: CGColor, end: CGColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [start, end]
        self.layer.insertSublayer(gradient, at: 0)
    }
    
}
