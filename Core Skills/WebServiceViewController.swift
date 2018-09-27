//
//  WebServiceViewController.swift
//  Core Skills
//
//  Created by sherriff on 2/23/17.
//  Copyright © 2017 Mark Sherriff. All rights reserved.
//
//
//  Assignment Notes: Similar to the accelerometer, certain
//  types of web updates are done off of the main thread.  Only
//  the main thread can update the UI.  So we have a separate 
//  button to update the UI.  Your code should populate the three
//  placeholder variables.  I would suggest looking at the information here:
//  https://developer.apple.com/swift/blog/?id=37

import UIKit

class WebServiceViewController: UIViewController {
    
    @IBOutlet weak var deptTextField: UITextField!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var instructorLabel: UILabel!
    
    var courseName : String = ""
    var instructor : String = ""
    var location : String = ""
    
    @IBAction func downloadData() {
        // This will split the input from the user into an array.
        let userInput = deptTextField.text!
        
        let inputArray = userInput.split { $0 == " " }
        
        let course = String(inputArray[0])
        let num = String(inputArray[1])

        // Add your code here
    }
    
    @IBAction func updateView(_ sender: Any) {
        // Helper function to update the screen.  No edits needed.
        courseNameLabel.text = courseName
        instructorLabel.text = instructor
        locationLabel.text = location
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(WebServiceViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
