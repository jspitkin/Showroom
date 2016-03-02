//
//  PaintingViewController.swift
//  Showroom
//
//  Created by Jake Pitkin on 2/23/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class PaintingViewController: UIViewController, BrushDelegate {
    
    private var _paintingCollection: PaintingCollection? = nil
    private var _paintingIndex: Int? = nil
    private var _brushChooserViewController: BrushChooserViewController?
    private var _color: CGColor!
    private var _endCap: CGLineCap!
    private var _lineJoin: CGLineJoin!
    private var _width: Float!
    
    var paintingCollection: PaintingCollection? {
        get { return _paintingCollection }
        set { _paintingCollection = newValue }
    }
    
    var paintingIndex: Int? {
        get { return _paintingIndex }
        set { _paintingIndex = newValue }
    }
    
    var labelView: UILabel {
        return view as! UILabel
    }
    
    var painting: Painting? {
        didSet {
            // TODO: Load painting into view
        }
    }
    
    override func loadView() {
        view = UILabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Painting"
        _brushChooserViewController = BrushChooserViewController()
        labelView.backgroundColor = UIColor.whiteColor()
        labelView.textAlignment = .Center
        labelView.numberOfLines = -1
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Brush", style: UIBarButtonItemStyle.Plain, target: self, action: "changeBrush")
        
        let backButton = UIBarButtonItem()
        backButton.title = "Painting"
        self.navigationItem.backBarButtonItem = backButton
    }
    
    func changeBrush() {
        _brushChooserViewController?.delegate = self
        self.navigationController?.pushViewController(_brushChooserViewController!, animated: true)
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // TODO: Convert between a Painting object from the data model
        
        if _paintingCollection == nil || _paintingIndex == nil {
            // TODO: Error
            return
        }
        
        let painting: Painting = _paintingCollection!.paintingWithIndex(paintingIndex!)
        labelView.text = "Cute painting"
    }
    
    func brushSaved(color: CGColor, endCap: CGLineCap, lineJoin: CGLineJoin, width: Float) {
        _color = color
        _endCap = endCap
        _lineJoin = lineJoin
        _width = width
    }
    

    
    
//    private func strokeToPolyline(stroke: Stroke) -> Polyline {
//        // TODO: Convert color and line characteristics
//        for point: Point in stroke.points {
//            // Converting from 0 -> 1 to 0 -> paintingView.bounds.width
//            let polyLinePoint: CGPoint = CGPointZero
//            polyLinePoint.x = point.x * paintingView.bounds.width
//            polyLinePoint.y = point.y * paintingView.bounds.height
//        }
//    }
}



