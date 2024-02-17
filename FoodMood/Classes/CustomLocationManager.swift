//
//  CustomLocationManager.swift
//  FoodMood
//
//  Created by Jason Mo on 6/29/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit



class CustomLocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = CustomLocationManager()
    

    let manager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        return manager
        
    }()
    
    var longitude: Double?
    var latitude: Double?
    var coordinate: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func startMySignificantLocationChanges() {
        if !CLLocationManager.significantLocationChangeMonitoringAvailable() {
            // The device does not support this service.
            return
        }
        manager.startMonitoringSignificantLocationChanges()
    }
    
    func stopMySignificantLocationChanges() {
        manager.stopMonitoringSignificantLocationChanges()
    }
    
    func checkLocationAuthorization() -> Bool {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            return true
        case .denied:
            // Show an alert letting them know what's up
            let alert = UIAlertController(title: "Location Services Off", message: "Please turn on Location Services to begin finding restaurants near you.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            return false
        case .notDetermined:
           manager.requestWhenInUseAuthorization()
        case .restricted:
            // Show an alert letting them know what's up
            let alert = UIAlertController(title: "Location Services Off", message: "Please turn on Location Services to begin finding restaurants near you.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            return false
        case .authorizedAlways:
            return true
        @unknown default:
            return false
        }
        return false
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let currentLocation = locations.last else { return }
            if(manager.authorizationStatus == .authorizedWhenInUse ||
                manager.authorizationStatus == .authorizedAlways) {
                coordinate = currentLocation.coordinate
                longitude = currentLocation.coordinate.longitude
                latitude = currentLocation.coordinate.latitude
                
            }
        }
        
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let error = error as? CLError, error.code == .denied {
           // Location updates are not authorized.
           manager.stopMonitoringSignificantLocationChanges()
           return
        }
    }
}


