//
//  ViewController.swift
//  MBParallaxScrollView
//
//  Created by Michael Babiy on 7/9/14.
//  Copyright (c) 2014 Michael Babiy. All rights reserved.
//

import UIKit

let parallaxCellIdentifier = "parallaxCell"

class HomeViewController: UICollectionViewController {
                                
    var images = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        for i in 0...14 {
            images.append("\(i)@2x")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        let parallaxCell = collectionView.dequeueReusableCellWithReuseIdentifier(parallaxCellIdentifier, forIndexPath: indexPath) as ParallaxCollectionViewCell
        parallaxCell.image = UIImage(named: images[indexPath.row])
        return parallaxCell
    }

    override func scrollViewDidScroll(scrollView: UIScrollView!) {
        if let visibleCells = collectionView.visibleCells() as? [ParallaxCollectionViewCell] {
            for parallaxCell in visibleCells {
                var yOffset = ((collectionView.contentOffset.y - parallaxCell.frame.origin.y) / ImageHeight) * OffsetSpeed
                parallaxCell.offset(CGPointMake(0.0, yOffset))
            }
        }
    }
    
}

