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
        
        let userInput = deptTextField.text!
        
        let inputArray = userInput.characters.split { $0 == " " }
        
        let course = String(inputArray[0])
        let num = String(inputArray[1])

        
        let ref = FIRDatabase.database().reference()
        ref.child(course + "/" + num).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            self.courseName = value?["courseName"] as? String ?? ""
            self.instructor = value?["instructor"] as? String ?? ""
            self.location = value?["location"] as? String ?? ""
            
            self.courseNameLabel.text = self.courseName
            self.instructorLabel.text = self.instructor
            self.locationLabel.text = self.location
            
            
            print(self.courseName)
            print(self.instructor)
            print(self.location)
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
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
