//
//  SuggestionViewController.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class SuggestionViewController: UIViewController {

    let suggestionView = SuggestionView()
    var yelpPropertiesCells: [YelpBusiness]?
    let networkingHandler = YelpNetworkingHandler()
    var latitude : Double?
    var longitude : Double?
    var myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        suggestionView.suggestionTableView.dataSource = self
        suggestionView.suggestionTableView.delegate = self
        suggestionView.suggestionTableView.rowHeight = 100
        latitude = 37.7749
        longitude = 122.4194
        
        print("Hello")
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        retrievingResponse()
    }
    
    override func loadView() {
        view = suggestionView
    }

    func retrievingResponse() {
        startActivityIndicator()
        networkingHandler.retrieveVenues(latitude: latitude ?? 37.7749, longitude: longitude ?? 122.4194) {
            [weak self] (properties, error) in
            
            
            guard let `self` = self else { return }
            self.yelpPropertiesCells = properties
            
            
            DispatchQueue.main.async {
                self.stopActivityIndicator()
                self.suggestionView.suggestionTableView.reloadData()
            }
            
        }
        
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

}

extension SuggestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yelpPropertiesCells?.count ?? 0 // replace with count later
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SuggestionTableViewCell
        cell.restaurantName.text = yelpPropertiesCells?[indexPath.row].name
//        cell.ratingLabel.text = (yelpPropertiesCells?[indexPath.row].rating as String).float
        cell.priceRange.text = yelpPropertiesCells?[indexPath.row].price
        cell.streetAddress.text = yelpPropertiesCells?[indexPath.row].location.address1
        
        return cell
    }
    
    
        
}

extension SuggestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = yelpPropertiesCells?[indexPath.row]
    }
    
}

extension SuggestionViewController:  UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }
}

