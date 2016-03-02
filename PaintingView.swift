//
//  PaintingView.swift
//  Showroom
//
//  Created by Jake Pitkin on 3/1/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

protocol PaintingDelegate: class
{
    func addStroke(newStroke: Stroke)
}

class PaintingView: UIView {
    
    private var touchPoints: [Point] = [Point]()
    private var _startX: CGFloat = 0
    private var _startY: CGFloat = 0
    
    var color: CGColor = UIColor.blackColor().CGColor
    var endCap: CGLineCap = CGLineCap.Round
    var lineJoin: CGLineJoin = CGLineJoin.Round
    var width: Float = 10

    weak var delegate: PaintingDelegate? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       self.backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.locationInView(self)
        _startX = touchPoint.x
        _startY = touchPoint.y
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.locationInView(self)
        touchPoints.append(Point(x: Double(touchPoint.x), y: Double(touchPoint.y)))
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        let stroke: Stroke = Stroke(color: color, endCap: endCap, lineJoin: lineJoin, width: width, points: touchPoints)
        delegate?.addStroke(stroke)
        touchPoints = [Point]()
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, CGFloat(width))
        CGContextSetStrokeColorWithColor(context, color)
        CGContextSetLineCap(context, endCap)
        CGContextSetLineJoin(context, lineJoin)
        
        let demoPath: CGMutablePathRef = CGPathCreateMutable();
        CGPathMoveToPoint(demoPath, nil, CGFloat(_startX), CGFloat(_startY))
        for point in touchPoints {
            CGPathAddLineToPoint(demoPath, nil, CGFloat(point.x), CGFloat(point.y))
        }
        CGContextAddPath(context, demoPath)
        CGContextStrokePath(context)
        
    }
    
}
