//
//  AppDelegate.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let launchKeys = launchOptions?[UIApplication.LaunchOptionsKey.location]
        if(launchKeys != nil) {
            CustomLocationManager.shared.manager.delegate = self
            
//            CustomLocationManager.shared.startMySignificantLocationChanges()
//            CustomLocationManager.shared.manager.allowsBackgroundLocationUpdates = true
//            CustomLocationManager.shared.manager.pausesLocationUpdatesAutomatically = false
            print("Hello app delegate")
        }
        CustomLocationManager.shared.manager.delegate = self
        
        CustomLocationManager.shared.manager.startUpdatingLocation()

        print("Hello app delegate")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("in the app delegate update location")
        guard let currentLocation = locations.last else { return }
            if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() == .authorizedAlways) {
//                print("Retrieved location \(CustomLocationManager.shared.coordinate)")
                CustomLocationManager.shared.latitude = currentLocation.coordinate.latitude
                CustomLocationManager.shared.longitude = currentLocation.coordinate.longitude
                CustomLocationManager.shared.coordinate = currentLocation.coordinate
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

