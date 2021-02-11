//
//  FareEvent.swift
//  Ridesharing App
//
//  Created by Ivan Tilev on 11.02.21.
//

import Foundation

// MARK: - Event
struct Event: Codable {
    let event: String
    let rideInfo: RideInfo
}

class RideInfo: Codable {
    let status: String
    let vehicleLocation, pickupLocation, dropoffLocation: Location
    let intermediateStopLocations: [Location]
}

// MARK: - Location
struct Location: Codable {
    let address: String?
    let lng, lat: Double
}
