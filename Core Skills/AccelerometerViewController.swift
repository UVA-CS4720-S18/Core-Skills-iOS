//
//  AccelerometerViewController.swift
//  Core Skills
//
//  Created by sherriff on 2/23/17.
//  Copyright © 2017 Mark Sherriff. All rights reserved.
//

import UIKit
import CoreMotion

class AccelerometerViewController: UIViewController {
    
    // NOTE: This can only really be tested on a device, not the simulator!
    
    lazy var motionManager = CMMotionManager()
    var xDir: Double!
    var yDir: Double!
    var zDir: Double!
    
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    @IBAction func startAccel(sender: UIButton) {
        if motionManager.isAccelerometerAvailable{
            motionManager.accelerometerUpdateInterval = 0.1
            let queue = OperationQueue()
            motionManager.startAccelerometerUpdates(to: queue, withHandler:
                {data, error in
                    
                    guard let data = data else{
                        return
                    }
                    
                    print("X = \(data.acceleration.x)")
                    print("Y = \(data.acceleration.y)")
                    print("Z = \(data.acceleration.z)")
                    self.xDir = data.acceleration.x
                    self.yDir = data.acceleration.y
                    self.zDir = data.acceleration.z

                    
            }
            )
        } else {
            print("Accelerometer is not available")
        }
    }
    
    @IBAction func checkDeviceRotation(sender: UIButton) {
        xLabel.text = "X = " + String(xDir)
        yLabel.text = "Y = " + String(yDir)
        zLabel.text = "Z = " + String(zDir)
        
    }



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
