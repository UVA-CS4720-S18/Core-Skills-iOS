//
//  CoreDataViewController.swift
//  Core Skills
//
//  Created by sherriff on 2/23/17.
//  Copyright © 2017 Mark Sherriff. All rights reserved.
//
//
//  Assignment Notes: We have already provided the data model for
//  you to use.  Make sure to look at CoreData.xcdatamodeld to see
//  how things are being stored.  Your two buttons here should 1) save
//  the data from the TextFields to CoreData and 2) load whatever is
//  the last entry in CoreData into the Labels.  I would look here for info:
//  https://www.raywenderlich.com/145809/getting-started-core-data-tutorial

import UIKit
import CoreData

class CoreDataViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var compIDTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var compIDLabel: UILabel!
    
    @IBAction func saveData(_ sender: UIButton) {
        // Add your code here    
    }
    
    
    @IBAction func loadData(_ sender: UIButton) {
        // Add your code here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CoreDataViewController.dismissKeyboard))
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
