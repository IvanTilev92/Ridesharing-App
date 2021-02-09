//
//  RiderAnnotation.swift
//  Ridesharing App
//
//  Created by Ivan Tilev on 9.02.21.
//

import UIKit
import MapKit

// This calss will represent the Rider on the map
class RiderAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
