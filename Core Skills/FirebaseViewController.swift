//
//  FirebaseViewController.swift
//  Core Skills
//
//  Created by sherriff on 2/23/17.
//  Copyright © 2017 Mark Sherriff. All rights reserved.
//
//
//  Assignment Notes: Firebase manages the network connection
//  separately so it is easier to update the UI than using the
//  built-in functions.  I would suggest seeing the docs found at:
//  https://firebase.google.com/docs/database/ios/read-and-write
//  The example database info can be found on the assignment page.
//  There is only one entry in the database - CS 4720.  If you use
//  the "child" notation, you'll need to use .child("CS/4720") to
//  get this piece of data.

import UIKit
import Firebase
import FirebaseDatabase


class FirebaseViewController: UIViewController {
    @IBOutlet weak var deptTextField: UITextField!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var instructorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var courseName : String = ""
    var instructor : String = ""
    var location : String = ""
    
    @IBAction func loadFirebaseData() {
        // This will split the input from the user into an array.
        let userInput = deptTextField.text!
        
        let inputArray = userInput.characters.split { $0 == " " }
        
        let course = String(inputArray[0])
        let num = String(inputArray[1])

        // Add your code here    
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FirebaseViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
