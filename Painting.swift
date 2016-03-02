//
//  Painting.swift
//  Showroom
//
//  Created by Jake Pitkin on 2/23/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class Painting {
    var strokes: [Stroke] = []
    //var aspectRatio: Double = 1.0
}

struct Stroke {
    var color: CGColor
    var endCap: CGLineCap
    var lineJoin: CGLineJoin
    var width: Float
    var points: [Point]
}

struct Point {
    var x: Double
    var y: Double
}