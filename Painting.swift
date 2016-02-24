//
//  Painting.swift
//  Showroom
//
//  Created by Jake Pitkin on 2/23/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import Foundation

class Painting {
    var strokes: [Stroke] = []
    var aspectRatio: Double = 1.0
}

struct Stroke {
    var color: Color
    var points: [Point]
}

struct Color {
    var r: Double
    var g: Double
    var b: Double
}

struct Point {
    var x: Double
    var y: Double
}