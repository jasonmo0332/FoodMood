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
    let restaurantViewController = RestaurantViewController()
    let remoteImageHelper = RemoteImageHelper()
    var latitude : Double?
    var longitude : Double?
    var myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        suggestionView.suggestionTableView.dataSource = self
        suggestionView.suggestionTableView.delegate = self
        suggestionView.suggestionTableView.rowHeight = 200
        print("view did load \(String(describing: longitude)) and \(String(describing: latitude))")
        
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
            
            print("in handler \(String(describing: self?.longitude)) and \(String(describing: self?.latitude))")
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
    
    func convertFloatToString(floatValue: Float) -> String {
        let convertedFloat = floatValue.description
        return convertedFloat
        
    }
    
    
    //Ex rating value is 3, set to rating3
    func setRatingImage(ratingValue : Float) -> String {
        switch ratingValue {
        case 5.0:
            return "rating5"
        case 4.5:
            return "rating4Half"
        case 4.0:
            return "rating4"
        case 3.5:
            return "rating3Half"
        case 3.0:
            return "rating3"
        case 2.5:
            return "rating2Half"
        case 2.0:
            return "rating2"
        case 1.5:
            return "rating1Half"
        case 1:
            return "rating1"
        default:
            return "rating0"
        }
    }

}

extension SuggestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yelpPropertiesCells?.count ?? 0 // replace with count later
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SuggestionTableViewCell
        remoteImageHelper.retrieveImage(urlString: yelpPropertiesCells?[indexPath.row].imageUrl) {
            image in cell.photoImageView.image = image
        }
        cell.restaurantName.text = yelpPropertiesCells?[indexPath.row].name
        cell.ratingLabel.text = convertFloatToString(floatValue: (yelpPropertiesCells?[indexPath.row].rating)!)
        cell.ratingImageView.image = UIImage(named: setRatingImage(ratingValue: (yelpPropertiesCells?[indexPath.row].rating)!))
        
        
        
            //set image to 4.5
        
        cell.priceRange.text = yelpPropertiesCells?[indexPath.row].price
        cell.streetAddress.text = yelpPropertiesCells?[indexPath.row].location.address1
        
        return cell
    }
    
    
        
}

extension SuggestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = yelpPropertiesCells?[indexPath.row]
        
        self.navigationController?.pushViewController(self.restaurantViewController, animated: false)
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

