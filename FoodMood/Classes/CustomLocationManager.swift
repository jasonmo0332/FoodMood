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
class CustomLocationManager {
    static var locationManager: CLLocationManager?
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            break
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            CustomLocationManager.locationManager?.requestWhenInUseAuthorization()
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
    
    func setupLocationManager() {
        CustomLocationManager.locationManager = CLLocationManager()
        
        CustomLocationManager.locationManager?.requestAlwaysAuthorization()
        CustomLocationManager.locationManager?.requestLocation()
        CustomLocationManager.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
            let alert = UIAlertController(title: "Location Services Off", message: "Please turn on Location Services to begin finding restaurants near you.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        }
    }
}
