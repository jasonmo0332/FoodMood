//
//  CustomActivityIndicator.swift
//  FoodMood
//
//  Created by Jason Mo on 6/9/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//


import UIKit
class CustomActivityIndicator : UIActivityIndicatorView {
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    func startActivityIndicator(view: UIView) {
        activityIndicator.center = view.center
        activityIndicator.color = .black
        // In most cases this will be set to true, so the indicator hides when it stops spinning
        
        activityIndicator.alpha = 0.5
        // Start the activity indicator and place it onto your view
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
    }
    
    func stopActivityIndicator() {
        
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
}
