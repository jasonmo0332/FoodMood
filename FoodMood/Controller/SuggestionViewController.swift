//
//  SuggestionViewController.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit
import CoreLocation

class SuggestionViewController: UIViewController, CLLocationManagerDelegate {

    let suggestionView = SuggestionView()
    var yelpPropertiesCells: [YelpBusiness]?
    var filteredYelpProperties: [YelpBusiness]?
    var filteredAndSortedYelpProperties: [YelpBusiness]?
    let networkingHandler = YelpNetworkingHandler()
    let remoteImageHelper = RemoteImageHelper()
    
    var category: String?
    var categoryName: String?
    let activityIndicator = CustomActivityIndicator()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        CustomLocationManager.shared.manager.delegate = self
//        CustomLocationManager.shared.manager.requestLocation()
        
        self.suggestionView.suggestionTableView.dataSource = self
        self.suggestionView.suggestionTableView.delegate = self
        suggestionView.suggestionTableView.rowHeight = 250
        
        
        // Do any additional setup after loading the view.
        guard let name = categoryName else { return }
        self.title = name
        
        retrievingResponse(latitude: CustomLocationManager.shared.latitude, longitude: CustomLocationManager.shared.longitude)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            filteredYelpProperties?.removeAll()
            self.suggestionView.suggestionTableView.reloadData()
            print("remove cells?")
        }
    }
    
    override func loadView() {
        view = suggestionView
    }

    func retrievingResponse(latitude: Double?, longitude: Double?) {
        
        guard let latitude = latitude, let longitude = longitude, let category = category else { return }
        networkingHandler.retrieveVenues(latitude: latitude, longitude: longitude, category: category) {
            [weak self] (properties, error) in
            
            
            
            guard let `self` = self else { return }
            
            guard let yelpPropertiesCells = properties else { return }
            self.yelpPropertiesCells = yelpPropertiesCells
            DispatchQueue.main.async {
                
                self.filterYelpBusiness(yelpProperties: yelpPropertiesCells)
                
                
                self.suggestionView.suggestionTableView.reloadData()
                self.activityIndicator.stopActivityIndicator()
                guard let filteredYelpProperties = self.filteredYelpProperties else { return }
                
                if filteredYelpProperties.count < 1 {
                    guard let categoryName = self.categoryName else { return }
                    let alert = UIAlertController(title: "No Restaurants Found", message: "There are no restuarants nearby that match \(categoryName). Please choose a new category", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
                        (action: UIAlertAction!) in self.navigationController?.popViewController(animated: true)
                        }))
                    self.present(alert, animated: true, completion: nil)
                    //return view controller saying no matches found near you for x category
                }
                self.sortYelpProperties(yelpProperties: filteredYelpProperties)
                
            }
            
        }
        
    }
    
    func sortYelpProperties(yelpProperties: [YelpBusiness]?) {
        guard let yelpProperties = yelpProperties else { return }
        //sorts values basedo on closest distance, need to unwrap optional double values
        self.filteredAndSortedYelpProperties = yelpProperties.sorted(by: {
           if let value1 = $0.distance {
               if let value2 = $1.distance {
                   return value1 < value2
               } else {
                   return false
               }
           } else {
                  if let value2 = $1.distance {
                      // there is no v1 - treat v2 as < v1
                      return true
                  } else {
                      // both are nil
                      return true
                  }
           }
       })
    }
    
    func filterYelpBusiness(yelpProperties : [YelpBusiness]?) {
        guard let yelpProperties = yelpProperties else { return }
        self.filteredYelpProperties = yelpProperties.filter {
            $0.imageUrl != nil && $0.name !=  nil && $0.reviewCount != nil && $0.rating != nil && $0.price != nil && $0.categories[0].title != nil && $0.location.address1 != nil && $0.distance != nil
        }
    }
    
   
    
    func convertFloatToString(floatValue: Float) -> String {
        let convertedFloat = floatValue.description
        return convertedFloat
        
    }
    func convertReviewCountIntToString(intValue: Int) -> String {
        let convertedInt = intValue.description + " Reviews"
        return convertedInt
        
    }
    
    func convertMetersToMiles(meters: Float) -> String {
        let MILE_CONVERTER: Float = 0.00062137119224
        let miles = meters * MILE_CONVERTER
        let convertedMiles = String(format: "%.2f",miles) + " mi"
        return convertedMiles
    }
    
    func determineClosed(isClosed : Bool) -> String {
        if isClosed == true {
            return "Open"
        }
        return "Closed"
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
        case 0.5:
            return "rating0Half"
        default:
            return "rating0"
        }
    }

}

extension SuggestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.activityIndicator.startActivityIndicator(view: self.suggestionView)
        return filteredYelpProperties?.count ?? 0 // replace with count later
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SuggestionTableViewCell
        guard let imageUrl = filteredAndSortedYelpProperties?[indexPath.row].imageUrl else { return cell }
        remoteImageHelper.retrieveImage(urlString: imageUrl) {
            image in cell.photoImageView.image = image
        }
        guard let restaurantName = filteredAndSortedYelpProperties?[indexPath.row].name,
            let ratingLabel = filteredAndSortedYelpProperties?[indexPath.row].reviewCount,
            let ratingImageView = filteredAndSortedYelpProperties?[indexPath.row].rating,
            let priceRange = filteredAndSortedYelpProperties?[indexPath.row].price,
            let foodType = filteredAndSortedYelpProperties?[indexPath.row].categories[0].title,
            let streetAddress = filteredAndSortedYelpProperties?[indexPath.row].location.address1,
            let distance = filteredAndSortedYelpProperties?[indexPath.row].distance else { return cell }
        
        cell.restaurantName.text = ("\(indexPath.row + 1). ") + restaurantName
        cell.ratingLabel.text = convertReviewCountIntToString(intValue: ratingLabel)
        cell.ratingImageView.image = UIImage(named: setRatingImage(ratingValue: ratingImageView))
        cell.priceRange.text = priceRange
        cell.foodType.text = foodType
        cell.streetAddress.text = streetAddress
        cell.distanceLabel.text = convertMetersToMiles(meters: Float(distance))
        
        return cell
    }
    
    
        
}

extension SuggestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurantViewController = RestaurantViewController()
        restaurantViewController.id = filteredAndSortedYelpProperties?[indexPath.row].id
        self.navigationController?.pushViewController(restaurantViewController, animated: true)
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



