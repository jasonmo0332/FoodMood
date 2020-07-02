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
        manager.requestAlwaysAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
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
    
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            
            break
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
           manager.requestWhenInUseAuthorization()
        case .restricted:
            // Show an alert letting them know what's up
            let alert = UIAlertController(title: "Location Services Off", message: "Please turn on Location Services to begin finding restaurants near you.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            break
        case .authorizedAlways:
            
            break
        @unknown default:
            break
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
            let alert = UIAlertController(title: "Location Services Off", message: "Please turn on Location Services to begin finding restaurants near you.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let currentLocation = locations.first else { return }
            if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() == .authorizedAlways) {
                coordinate = currentLocation.coordinate
                longitude = currentLocation.coordinate.longitude
                latitude = currentLocation.coordinate.latitude
                print("\(longitude) longitude \(latitude) latitude")
            }
        }
        
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}


