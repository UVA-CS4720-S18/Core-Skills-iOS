//
//  CoreDataViewController.swift
//  Core Skills
//
//  Created by sherriff on 2/23/17.
//  Copyright © 2017 Mark Sherriff. All rights reserved.
//
//
//  Assignment Notes: We have already provided the data model for
//  you to use.  Make sure to look at CoreDAta.xcdatamodeld to see
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
        // --- Delete ---
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let context =
            appDelegate.persistentContainer.viewContext
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "Person", in: context)!
        
        let transc = NSManagedObject(entity: entity, insertInto: context)
        
        //set the entity values
        transc.setValue(nameTextField.text!, forKey: "name")
        transc.setValue(compIDTextField.text!, forKey: "compID")
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
        // --- End Delete ---
    }
    
    
    @IBAction func loadData(_ sender: UIButton) {
        // --- Delete ---
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let context =
            appDelegate.persistentContainer.viewContext
        
        do {
            //go get the results
            let searchResults = try context.fetch(fetchRequest)
            
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for person in searchResults as [NSManagedObject] {
                
                print("\(person.value(forKey: "compID"))")
                self.compIDLabel.text = person.value(forKey: "compID") as! String?
                self.nameLabel.text = person.value(forKey: "name") as! String?

            }
        } catch {
            print("Error with request: \(error)")
        }
        // --- End Delete ---
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
