//
//  PaintingListViewController.swift
//  Showroom
//
//  Created by Jake Pitkin on 2/23/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class PaintingListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, PaintingCollectionDelegate {

    private var _paintingCollection: PaintingCollection = PaintingCollection()
    
    private var paintingListView: UICollectionView {
        return view as! UICollectionView
    }
    
    // MARK: - UIViewController Overrides
    override func loadView() {
        let paintingsLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        view = UICollectionView(frame: CGRectZero, collectionViewLayout: paintingsLayout)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Paintings"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New", style: UIBarButtonItemStyle.Plain, target: self, action: "newPainting")
        
        _paintingCollection.delegate = self
        paintingListView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(UICollectionViewCell.self))
        paintingListView.dataSource = self
        paintingListView.delegate = self
    }
    
    func newPainting() {
        let paintingViewController: PaintingViewController = PaintingViewController()
        var newPainting = Painting()
        _paintingCollection.addPainting(newPainting)
        paintingViewController.paintingCollection = _paintingCollection
        paintingViewController.paintingIndex = _paintingCollection.paintingCount - 1
        paintingListView.reloadData()
        self.navigationController?.pushViewController(paintingViewController, animated: true)
    }
    
    // MARK: - UICollectionViewDelegate Methods
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        // Obtain data element based on indexPath
        let painting: Painting = _paintingCollection.paintingWithIndex(indexPath.item)
        let paintingIndex: Int = indexPath.item
        
        // Build a view controller and give it the data it needs
        let paintingViewController: PaintingViewController = PaintingViewController()
        paintingViewController.paintingCollection = _paintingCollection
        paintingViewController.paintingIndex = paintingIndex
        paintingViewController.painting = painting
        
        navigationController?.pushViewController(paintingViewController, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _paintingCollection.paintingCount;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // Obtain data element based on indexPath
        //let painting: Painting = _paintingCollection.paintingWithIndex(indexPath.item)
        
        // Convert into a view (or a cell)
        let cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(NSStringFromClass(UICollectionViewCell.self), forIndexPath: indexPath)
        cell.backgroundColor = UIColor.greenColor()
        
        //var title = UILabel(frame: CGRectMake(0, 0, cell.bounds.size.width, 40))
        //title.text = "\(_paintingCollection.paintingWithIndex(indexPath.item).strokes.count)"
        var painting = PaintingView()
        cell.contentView.addSubview(painting)
        
        // This will be replaced with an instance of a Painting View
        
        return cell
    }
    
    // MARK: PaintingCollectionDelegate Methods
    func collection(collection: PaintingCollection, strokeAddedToPaintingAtIndex paintingIndex: Int) {
        paintingListView.reloadData()
    }
    
    func paintingDeleted() {
        paintingListView.reloadData()
    }
}