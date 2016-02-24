//
//  PaintingViewController.swift
//  Showroom
//
//  Created by Jake Pitkin on 2/23/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class PaintingViewController: UIViewController {
    var labelView: UILabel {
        return view as! UILabel
    }
    
    override func loadView() {
        view = UILabel()
    }
    
    override func viewDidLoad() {
        labelView.backgroundColor = UIColor.whiteColor()
        labelView.textAlignment = .Center
        labelView.numberOfLines = -1
        
        
    }
}



