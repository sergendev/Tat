//
//  QuestionCollectionViewCell.swift
//  GetStartedSwift
//
//  Created by Sergen Gonenc on 9/8/19.
//  Copyright © 2019 Memucas. All rights reserved.
//

import UIKit

@IBDesignable class QuestionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
