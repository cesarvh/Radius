//
//  HomeScreenViewController.swift
//  ios-decal-proj4
//
//  Created by Cesar Villalobos on 12/5/15.
//  Copyright © 2015 Cesar Villalobos, Nag Alluri, Kelly Hong. All rights reserved.
//

import UIKit
import MessageUI
import MapKit
import CoreLocation

class HomeScreenViewController: UIViewController, MFMessageComposeViewControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate{
    @IBOutlet weak var bottomNavBar: UINavigationBar!
    
    @IBOutlet weak var Map: MKMapView!
    let locationmanager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationmanager.delegate = self
        self.locationmanager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationmanager.requestWhenInUseAuthorization()
        self.locationmanager.startUpdatingLocation()
        self.navigationController!.navigationBar.barTintColor = UIColor(red:0.81, green:0.92, blue:0.93, alpha:1.0)
        

        

        self.Map.showsUserLocation = true
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func canSendText() -> Bool {
        return MFMessageComposeViewController.canSendText()
    }
    
    @IBAction func sendMessage(sender: AnyObject) {
        let messageVC = MFMessageComposeViewController()
        
        messageVC.body = "Enter a message";
        messageVC.recipients = ["Enter tel-nr"]
        messageVC.messageComposeDelegate = self;
        
        //        self.presentViewController(messageVC, animated: false, completion: nil)
    }
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        switch (result.rawValue) {
        case MessageComposeResultCancelled.rawValue:
            print("Message was cancelled")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultFailed.rawValue:
            print("Message failed")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultSent.rawValue:
            print("Message was sent")
            self.dismissViewControllerAnimated(true, completion: nil)
        default:
            break;
        }
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    //Mark: Location Delegate Methods
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2DMake(location!.coordinate.latitude, location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpanMake(1, 1))
        self.Map.setRegion(region, animated: true)
        self.locationmanager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors: " + error.localizedDescription)
    }
    
}