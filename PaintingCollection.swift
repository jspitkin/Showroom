//
//  PaintingCollection.swift
//  Showroom
//
//  Created by Jake Pitkin on 2/23/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import Foundation

protocol PaintingCollectionDelegate: class {
    func collection(collection: PaintingCollection, strokeAddedToPaintingAtIndex paintingIndex: Int)
}

class PaintingCollection {
    private var _paintings: [Painting] = []
    
    // MARK: Indexing
    var paintingCount: Int! {
        return _paintings.count
    }
    
    // MARK: Element Access
    func paintingWithIndex(paintingIndex: Int) -> Painting {
        return _paintings[paintingIndex]
    }
    
    func addPainting(painting: Painting) {
        _paintings.append(painting)
    }
    
    func removePaintingWithIndex(paintingIndex: Int) {
        _paintings.removeAtIndex(paintingIndex)
    }
    
    func addStroke(stroke: Stroke, toPainting paintingIndex: Int) {
        let painting: Painting = paintingWithIndex(paintingIndex)
        painting.strokes.append(stroke)
        delegate?.collection(self, strokeAddedToPaintingAtIndex: paintingIndex)
    }
    
    // MARK: Events
   weak var delegate: PaintingCollectionDelegate?
}