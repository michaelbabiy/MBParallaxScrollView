//
//  ParallaxCollectionViewCell.swift
//  MBParallaxScrollView
//
//  Created by Michael Babiy on 7/9/14.
//  Copyright (c) 2014 Michael Babiy. All rights reserved.
//

import UIKit

let ImageHeight: CGFloat = 200.0
let OffsetSpeed: CGFloat = 25.0

class ParallaxCollectionViewCell: UICollectionViewCell {
    
    // AspectFill; 200 points.
    @IBOutlet var imageView: UIImageView
    
    var image: UIImage = UIImage() {
        didSet {
            imageView.image = image
        }
    }
    
    func offset(offset: CGPoint) {
        imageView.frame = CGRectOffset(self.imageView.bounds, offset.x, offset.y)
    }
    
}
