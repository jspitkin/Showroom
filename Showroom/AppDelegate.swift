//
//  AppDelegate.swift
//  Showroom
//
//  Created by Jake Pitkin on 2/22/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //var controlPanel: ControlPanelView?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let paintingListViewController = PaintingListViewController()
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = UINavigationController(rootViewController: paintingListViewController)
        window?.makeKeyAndVisible()

        return true
    }
    
    

}

