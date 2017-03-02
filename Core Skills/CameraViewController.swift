//
//  CameraViewController.swift
//  Core Skills
//
//  Created by sherriff on 2/23/17.
//  Copyright © 2017 Mark Sherriff. All rights reserved.
//
//
//  Assignment Notes: I suggest following the tutorial found at
//  http://www.techotopia.com/index.php/An_Example_Swift_iOS_8_iPhone_Camera_Application

import UIKit
import MobileCoreServices

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var newMedia: Bool?
    
    @IBAction func useCamera(_ sender: AnyObject) {
        // Add your code here
    }
    
    @IBAction func useImageLibrary(_ sender: AnyObject) {
        // Add your code here
    }
    
    // You can add more functions here if needed
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   
}
