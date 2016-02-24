//
//  PaintingCollection.swift
//  Showroom
//
//  Created by Jake Pitkin on 2/23/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import Foundation

class PaintingCollection {
    private var _paintings: [Painting] = []
    
    // MARK: Indexing
    var paintingCount: Int {
        return _paintings.count
    }
    
    // MARK: Element Access
    func paintingWithIndex(paintingIndex: Int) -> Painting {
        return _paintings[paintingIndex]
    }
    
    func addPainting(painting: Painting) {
        
    }
    
    func removePaintingWithIndex(paintingIndex: Int) {
        
    }
    
    // MARK: Filtering and Sorting
    func paintingsByAuthorByDate(author: String) -> [Int] {
        return []
    }
    
    func addStroke(stroke: Stroke, toPainting paintingIndex: Int) {
        paintingChangedHandler?(paintingIndex: paintingIndex)
    }
    
    // MARK: Events
    var paintingChangedHandler: ((paintingIndex: Int) -> Void)?
}