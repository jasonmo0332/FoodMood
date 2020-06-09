//
//  CustomActivityIndicator.swift
//  FoodMood
//
//  Created by Jason Mo on 6/9/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//


import UIKit
class CustomActivityIndicator : UIActivityIndicatorView {
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    func startActivityIndicator(view: UIView) {
        activityIndicator.center = view.center
        // In most cases this will be set to true, so the indicator hides when it stops spinning
        activityIndicator.hidesWhenStopped = true

        // Start the activity indicator and place it onto your view
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    func stopActivityIndicator() {
         activityIndicator.stopAnimating()
    }
    
}
