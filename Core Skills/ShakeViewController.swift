//
//  ShakeViewController.swift
//  Core Skills
//
//  Created by sherriff on 2/23/17.
//  Copyright © 2017 Mark Sherriff. All rights reserved.
//

import UIKit
import CoreMotion

class ShakeViewController: UIViewController {
    
    lazy var motionManager = CMMotionManager()

    @IBOutlet weak var shakeLabel: UILabel!
    var shakeCount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // function to allow for detecting a shake
    override func motionEnded(_ motion: UIEventSubtype,
                              with: UIEvent?) {
        
       shakeCount += 1
        shakeLabel.text = "Shake Count: " + String(shakeCount)
            
        
        
    }
   
}
