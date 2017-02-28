//
//  UserDefaultsViewController.swift
//  Core Skills
//
//  Created by sherriff on 2/23/17.
//  Copyright © 2017 Mark Sherriff. All rights reserved.
//
//  
//  Assignment Notes: Much like the CoreData feature, the save and load
//  buttons should save the TextFields and load into the Labels.
//  Plenty of example code out there, but here's one to start with:
//  http://www.thomashanning.com/userdefaults/

import UIKit

class UserDefaultsViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var compIDTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var compIDLabel: UILabel!
    @IBAction func saveData(_ sender: UIButton) {
        // --- Delete ---
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        UserDefaults.standard.set(compIDTextField.text, forKey: "compID")
        // --- End Delete ---
    }
    @IBAction func loadData(_ sender: UIButton) {
        // --- Delete ---
        let name = UserDefaults.standard.string(forKey: "name")
        let compID = UserDefaults.standard.string(forKey: "compID")
        
        nameLabel.text = name!
        compIDLabel.text = compID!
        // --- End Delete ---
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UserDefaultsViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
