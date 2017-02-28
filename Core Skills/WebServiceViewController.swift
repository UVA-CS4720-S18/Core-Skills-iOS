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
//  placeholder variables.

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
        
        // --- Delete ---
        let userInput = deptTextField.text!
        
        let inputArray = userInput.characters.split { $0 == " " }
        
        let course = String(inputArray[0])
        let num = String(inputArray[1])
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        
        let urlString = "http://stardock.cs.virginia.edu/louslist/Courses/view/" + course + "/" + num + "?json"
        
        let url = URL(string: urlString)!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                    
                    
                    if let array = json as? [Any] {
                        if let firstObject = array.first {
                            if let dictionary = firstObject as? [String: Any] {
                                self.courseName = (dictionary["courseName"] as? String)!
                                self.instructor = (dictionary["instructor"] as? String)!
                                self.location = (dictionary["location"] as? String)!
                                
                            }

                        }
                    }
                    
                    
                    
                    
                    
                } catch {
                    print("error in JSONSerialization")
                }
            }
        })
        task.resume()
        // --- End Delete ---

    }
    
    @IBAction func updateView(_ sender: Any) {
        courseNameLabel.text = courseName
        instructorLabel.text = instructor
        locationLabel.text = location
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(WebServiceViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
