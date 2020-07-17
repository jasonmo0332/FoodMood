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
//        manager.desiredAccuracy = kCLLocationAccuracyBest
        return manager
        
    }()
    
    var longitude: Double?
    var latitude: Double?
    var coordinate: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
        checkLocationServices()
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
        switch CLLocationManager.authorizationStatus() {
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
    
    func checkLocationServices() -> Bool {
        if CLLocationManager.locationServicesEnabled() {
            print("In location service")
            if checkLocationAuthorization() {
                return true
            } else {
                return false
            }
            
        } else {
            // Show alert letting the user know they have to turn this on.
            print("In here")
            return false
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let currentLocation = locations.last else { return }
            if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() == .authorizedAlways) {
                coordinate = currentLocation.coordinate
                longitude = currentLocation.coordinate.longitude
                latitude = currentLocation.coordinate.latitude
                print("\(longitude) longitude \(latitude) latitude")
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


