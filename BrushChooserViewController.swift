//
//  BrushChooserViewController.swift
//  Showroom
//
//  Created by Jake Pitkin on 2/29/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

protocol BrushDelegate: class
{
    func brushSaved(color: CGColor, endCap: CGLineCap, lineJoin: CGLineJoin, width: Float)
}

class BrushChooserViewController: UIViewController {

    var controlPanel: ControlPanelView {
        return view as! ControlPanelView
    }
    
    weak var delegate: BrushDelegate? = nil
    
    override func loadView() {
        view = ControlPanelView()
        self.navigationItem.hidesBackButton = true
        let saveButton = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Plain, target: self, action: "saveChanges")
        self.navigationItem.leftBarButtonItem = saveButton;
    }
    
    override func viewDidLoad(){
    }
    
    
    func saveChanges() {
        delegate?.brushSaved(controlPanel.preview.color, endCap: controlPanel.preview.endCap, lineJoin: controlPanel.preview.lineJoin, width: controlPanel.preview.width)
        self.navigationController?.popViewControllerAnimated(true)
    }

}
