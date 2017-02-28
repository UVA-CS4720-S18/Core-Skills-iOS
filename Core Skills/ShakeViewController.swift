//
//  ShakeViewController.swift
//  Core Skills
//
//  Created by sherriff on 2/23/17.
//  Copyright © 2017 Mark Sherriff. All rights reserved.
//
//
//  Assignment Notes: For this feature, add code to the 
//  motionEnded function to up the value of shakeCount by
//  1 on each shake and then update the screen.

import UIKit
import CoreMotion

class ShakeViewController: UIViewController {
    
    lazy var motionManager = CMMotionManager()

    @IBOutlet weak var shakeLabel: UILabel!
    var shakeCount : Int = 0
    
        // function to allow for detecting a shake
    override func motionEnded(_ motion: UIEventSubtype,
                              with: UIEvent?) {
        // ---- Delete -----
        shakeCount += 1
        shakeLabel.text = "Shake Count: " + String(shakeCount)
        // ---- End Delete ----
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

   
}
