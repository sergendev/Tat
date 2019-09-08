//
//  StatsCollectionViewCell.swift
//  GetStartedSwift
//
//  Created by Sergen Gonenc on 9/7/19.
//  Copyright © 2019 Memucas. All rights reserved.
//

import Foundation
import ScrollableGraphView

@IBDesignable class StatsCollectionViewCell: UICollectionViewCell {
    
    // @IBOutlet var graphView: ScrollableGraphView!
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
