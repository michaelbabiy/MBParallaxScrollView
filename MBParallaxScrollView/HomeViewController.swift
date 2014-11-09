//
//  ViewController.swift
//  MBParallaxScrollView
//
//  Created by Michael Babiy on 7/9/14.
//  Copyright (c) 2014 Michael Babiy. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
    

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let parallaxCell = collectionView.dequeueReusableCellWithReuseIdentifier(parallaxCellIdentifier, forIndexPath: indexPath) as ParallaxCollectionViewCell
        parallaxCell.image = UIImage(named: images[indexPath.row])!
        return parallaxCell
    }

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if let visibleCells = collectionView.visibleCells() as? [ParallaxCollectionViewCell] {
            for parallaxCell in visibleCells {
                var yOffset = ((collectionView.contentOffset.y - parallaxCell.frame.origin.y) / ImageHeight) * OffsetSpeed
                parallaxCell.offset(CGPointMake(0.0, yOffset))
            }
        }
    }
    
}

