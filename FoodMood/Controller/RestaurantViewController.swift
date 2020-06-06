//
//  RestaurantViewController.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {
    var id: String?
    let restaurantView = RestaurantView()
    
    var myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func startActivityIndicator() {
        myActivityIndicator.center = view.center
        // In most cases this will be set to true, so the indicator hides when it stops spinning
        myActivityIndicator.hidesWhenStopped = true

        // Start the activity indicator and place it onto your view
        myActivityIndicator.startAnimating()
        view.addSubview(myActivityIndicator)
    }
    
    func stopActivityIndicator() {
         myActivityIndicator.stopAnimating()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
