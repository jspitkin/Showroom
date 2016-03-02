//
//  PaintingViewController.swift
//  Showroom
//
//  Created by Jake Pitkin on 2/23/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class PaintingViewController: UIViewController, BrushDelegate, PaintingDelegate{
    
    private var _paintingCollection: PaintingCollection!
    private var _paintingIndex: Int? = nil
    
    private var _brushChooserViewController: BrushChooserViewController?
    private var _paintingView: PaintingView = PaintingView()
    
    private var _red: Float = 0
    private var _green: Float = 0
    private var _blue: Float = 0
    private var _endCap: CGLineCap!
    private var _lineJoin: CGLineJoin!
    private var _width: Float!
    
    var paintingCollection: PaintingCollection? {
        get { return _paintingCollection }
        set { _paintingCollection = newValue }
    }
    
    var paintingIndex: Int! {
        get { return _paintingIndex }
        set { _paintingIndex = newValue }
    }
    
    var painting: Painting? {
        didSet {
            //_paintingView.strokes = _paintingCollection.getStrokes(paintingIndex)
        }
    }

    
    override func loadView() {
        view = _paintingView
       _paintingView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _paintingView.strokes = _paintingCollection.getStrokes(paintingIndex)
        _brushChooserViewController = BrushChooserViewController()
        _brushChooserViewController?.delegate = self
        
        let trashImage = UIImage(named: "trash")!
        let brushButton: UIBarButtonItem = UIBarButtonItem(title: "Brush", style: UIBarButtonItemStyle.Plain, target: self, action: "changeBrush")
        let deleteButton: UIBarButtonItem = UIBarButtonItem(image: trashImage, style: UIBarButtonItemStyle.Plain, target: self, action: "delete")
        self.navigationItem.rightBarButtonItems = [brushButton, deleteButton]
    }
    
    func changeBrush() {
        self.navigationController?.pushViewController(_brushChooserViewController!, animated: true)
    }
    
    func delete() {
        paintingCollection?.removePaintingWithIndex(paintingIndex)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func brushSaved(color: CGColor, endCap: CGLineCap, lineJoin: CGLineJoin, width: Float) {
        _paintingView.endCap = endCap
        _paintingView.lineJoin = lineJoin
        _paintingView.width = width
        _paintingView.color = color
    }
    
    func addStroke(var newStroke: Stroke) {
        _paintingCollection?.addStroke(newStroke, toPainting: paintingIndex!)
    }

}



