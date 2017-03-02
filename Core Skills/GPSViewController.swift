//
//  GPSViewController.swift
//  Core Skills
//
//  Created by sherriff on 2/21/17.
//  Copyright © 2017 Mark Sherriff. All rights reserved.
//
//
//  Assignment Notes: I have already added the needed permissions
//  to the Info.plist file.  I suggest taking a look at:
//  http://swiftdeveloperblog.com/code-examples/determine-users-current-location-example-in-swift/

import UIKit
import CoreLocation

class GPSViewController: UIViewController, CLLocationManagerDelegate { 
    
    var locationManager: CLLocationManager?

    @IBOutlet weak var lat: UILabel!
    @IBOutlet weak var lon: UILabel!
    
    func createLocationManager(startImmediately: Bool){
        // Add code to start the locationManager
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Add your code here
        // Code here is called when the location updates
    }



    @IBAction func startGPS(_ sender: UIButton) {
        // Helper function provided to manage authorization - no edits needed.
        
        /* Are location services available on this device? */
        if CLLocationManager.locationServicesEnabled(){
            
            /* Do we have authorization to access location services? */
            switch CLLocationManager.authorizationStatus(){
            case .authorizedAlways:
                /* Yes, always */
                createLocationManager(startImmediately: true)
            case .authorizedWhenInUse:
                /* Yes, only when our app is in use  */
                createLocationManager(startImmediately: true)
            case .denied:
                /* No */
                displayAlertWithTitle(title: "Not Determined",
                                      message: "Location services are not allowed for this app")
            case .notDetermined:
                /* We don't know yet, we have to ask */
                createLocationManager(startImmediately: false)
                if let manager = self.locationManager{
                    manager.requestWhenInUseAuthorization()
                }
            case .restricted:
                /* Restrictions have been applied, we have no access
                 to location services */
                displayAlertWithTitle(title: "Restricted",
                                      message: "Location services are not allowed for this app")
            }
            
            
        } else {
            /* Location services are not enabled.
             Take appropriate action: for instance, prompt the
             user to enable the location services */
            print("Location services are not enabled")
        }

    }

    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        // Code here is called on an error - no edits needed.
        print("Location manager failed with error = \(error)")
    }
    
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        // Code here is called when authoization changes - no edits needed.
        print("The authorization status of location services is changed to: ", terminator: "")
    
        switch CLLocationManager.authorizationStatus(){
            case .authorizedAlways:
                print("Authorized")
            case .authorizedWhenInUse:
                print("Authorized when in use")
            case .denied:
                print("Denied")
            case .notDetermined:
                print("Not determined")
            case .restricted:
                print("Restricted")
        }
    
    }
    
    func displayAlertWithTitle(title: String, message: String){
        // Helper function for displaying dialog windows - no edits needed.
        let controller = UIAlertController(title: title,
                                           message: message,
                                           preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: "OK",
                                           style: .default,
                                           handler: nil))
        
        present(controller, animated: true, completion: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
