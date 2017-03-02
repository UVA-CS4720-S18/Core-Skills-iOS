//
//  ShakeViewController.swift
//  Core Skills
//
//  Created by sherriff on 2/23/17.
//  Copyright © 2017 Mark Sherriff. All rights reserved.
//
//
//  Assignment Notes: For this feature, add a function called
//  motionEnded that will increase the value of shakeCount by
//  1 on each shake and then update the screen.  This funcion
//  is an override for anything using CoreMotion.

import UIKit
import CoreMotion

class ShakeViewController: UIViewController {
    
    lazy var motionManager = CMMotionManager()

    @IBOutlet weak var shakeLabel: UILabel!
    var shakeCount : Int = 0
    
    // Add your motionEnded function here
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

   
}
