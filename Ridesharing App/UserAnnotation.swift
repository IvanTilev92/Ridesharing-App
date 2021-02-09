//
//  UserAnnotation.swift
//  Ridesharing App
//
//  Created by Ivan Tilev on 9.02.21.
//

import UIKit
import MapKit

// This calss will represent the User on the map
class UserAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String ,subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}


