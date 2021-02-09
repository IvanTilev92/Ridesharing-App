//
//  ViewController.swift
//  Ridesharing App
//
//  Created by Ivan Tilev on 8.02.21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    // MapView outlet
    @IBOutlet var mapView: MKMapView!
    
    // Location Manager
    let manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Will set the location manager, the accuracy and will ask for permition.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    
    //MARK: - DidUpdateLocations Delegete Method
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // User Location
        if let locationUser = locations.first {
            manager.stopUpdatingLocation()
            
            renderUser(locationUser)
        }
        
        // Rider Location
        renderRider()
        
    }
    
    // Render function that will zoom the map and add a pin
    func renderUser(_ location: CLLocation) {
        
        // Creatin a coordinate and span properties, that will pass to the region
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        // Setting the map reagion
        mapView.setRegion(region, animated: true)
        
        // Adding the pin on the map
        let pinUser = UserAnnotation(title: "User", subtitle: "", coordinate: coordinate)
        mapView.addAnnotation(pinUser)
    }

    func renderRider() {
        
        let latitudeRider: CLLocationDegrees = 52.4731394
        let longitureRider: CLLocationDegrees = 13.4375338
        
        let locationRider: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitudeRider, longitureRider)
        
        let pinRider = RiderAnnotation(title: "Rider", subtitle: "", coordinate: locationRider)
        mapView.addAnnotation(pinRider)
    }
}

