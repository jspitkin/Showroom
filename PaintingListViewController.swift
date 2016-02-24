//
//  PaintingListViewController.swift
//  Showroom
//
//  Created by Jake Pitkin on 2/23/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

// add back UICollectionViewDataSource
class PaintingListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let paintings: PaintingCollection = PaintingCollection()
    
    // MARK: - UIViewController Overrides
    override func loadView() {
        let paintingsLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        view = UICollectionView(frame: CGRectZero, collectionViewLayout: paintingsLayout)
    }
    
    override func viewDidLoad() {
        
    }
    
    // MARK: - UICollectionViewDelegate Methods
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        
        // Obtain data element based on indexPath
        let thing: String = "hi"
        
        let paintingViewController: PaintingViewController = PaintingViewController()
        paintingViewController.labelView.text = thing
        navigationController?.pushViewController(paintingViewController, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let thing: String = "hello"
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(NSStringFromClass(UICollectionViewCell.self), forIndexPath: indexPath)
        
        let titleLabel: UILabel = cell.contentView.subviews.count == 0 ? UILabel(frame: CGRectMake(0.0, 0.0, 50.0, 50.0)) : cell.contentView.subviews[0] as! UILabel
        titleLabel.text = thing
        titleLabel.textColor = UIColor.whiteColor()
        cell.contentView.addSubview(titleLabel)
        
        return cell
    }
}