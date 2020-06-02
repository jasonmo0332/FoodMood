//
//  MainSwipeViewController.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit
import CoreLocation
import YelpAPI


class MainSwipeViewController: UIViewController, CLLocationManagerDelegate {
    
    let mainSwipeView = MainSwipeView()
//    var divisionParam: CGFloat!
    let suggestionViewController = SuggestionViewController()
    let foodCategories = FoodCategories()
    var locationManager: CLLocationManager?
    var latitude : Double?
    var longitude : Double?
//    let appId = "60xkWIHq4BodwFEnFy9tSg"
    let decoder = JSONDecoder()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        longitude = 122.4194
        latitude = 37.7749
        mainSwipeView.cardView.foodCategoryLabel.text = randomizeCategory()
        //setup pan gesture
        createPanGestureRecognizer(targetView: mainSwipeView.cardView)
        
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = mainSwipeView
    }
    
    
    // The Pan Gesture
    func createPanGestureRecognizer(targetView: UIView) {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureValueChanged(_:)))
        targetView.addGestureRecognizer(panGesture)
        print("added pan gesture")
    }
    
    
    
    
    @objc func panGestureValueChanged(_ sender: UIPanGestureRecognizer) {
        
        //this card view is what is passed in not the view
        let cardView = sender.view!
        let originalY = cardView.center.y
        let translationPoint = sender.translation(in: view)
        cardView.center = CGPoint(x: view.center.x+translationPoint.x, y: originalY)
          
        let distanceMoved = cardView.center.x - view.center.x
//            if distanceMoved > 0 { // moved right side
//
//            }
//            else { // moved left side
//
//
//            }

        //rotates the card
        cardView.transform = CGAffineTransform(rotationAngle: distanceMoved/(view.frame.size.width/2)/1.5)
        print("before end")
        
        if sender.state == UIGestureRecognizer.State.ended {
            if cardView.center.x < 20 { // Moved to left
                UIView.animate(withDuration: 0.3, animations: {
                    cardView.center = CGPoint(x: cardView.center.x-200, y: cardView.center.y)
                    
                })
                //new card slides back
                UIView.animate(withDuration: 1.8, animations: {
                    self.setupNewCard()
                })
                
                return
                
            }
            
            else if (cardView.center.x > (view.frame.size.width-20)) { // Moved to right
               UIView.animate(withDuration: 0.3, animations: {
                    cardView.center = CGPoint(x: cardView.center.x+200, y: cardView.center.y)
                    
               })
                retrieveVenues(latitude: latitude ?? 37.7749, longitude: longitude ?? 122.4194, category: "Food", limit: 10, sortBy: "best_match", locale: "en_US") { (properties, error) in
                    self.suggestionViewController.yelpPropertiesCells = properties
                    //after completion finishes so threads are not mixed
                    //Possible issues here
                    self.navigationController?.pushViewController(self.suggestionViewController, animated: false)
                    UIView.animate(withDuration: 2, animations: {
                         self.setupSameCard()
                     })
                    
                }
               
               
               return
                
            }
            
            //resets but not fully
            UIView.animate(withDuration: 0.2, animations: {
                cardView.center = self.view.center //center of the main view
                cardView.transform = .identity
                print("Reached Here")
            })
        }
        
    }
        
    func setupNewCard() {
        self.mainSwipeView.cardView.center.x = self.mainSwipeView.center.x
        self.mainSwipeView.cardView.center.y = self.mainSwipeView.center.y
        self.mainSwipeView.cardView.transform = .identity
        print("Reached new card")
        self.mainSwipeView.cardView.foodCategoryLabel.text = randomizeCategory()
    }

    func setupSameCard() {
        self.mainSwipeView.cardView.center.x = self.mainSwipeView.center.x
        self.mainSwipeView.cardView.center.y = self.mainSwipeView.center.y
        self.mainSwipeView.cardView.transform = .identity
    }

    func randomizeCategory() -> String {
        if foodCategories.foodCategories.count != 0 {
            let remainingSize = foodCategories.foodCategories.count
            let randomIndex = randomNumberGenerator(arraySize: remainingSize)
            let currentChoice = foodCategories.foodCategories[randomIndex] //grabs currentchoice
            foodCategories.foodCategories.remove(at: randomIndex) //removes current choice
            return currentChoice
        }
        foodCategories.refreshFoodCategories()
        return "Empty"
    }
    
    func randomNumberGenerator(arraySize : Int) -> Int {
        let randomNumber = Int.random(in: 0..<arraySize)
        return randomNumber
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        // set the value of lat and long
        latitude = location.latitude
        longitude = location.longitude

    }

}



extension MainSwipeViewController:  UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }
}

extension MainSwipeViewController {
    func retrieveVenues(latitude: Double,
                        longitude: Double,
                        category: String,
                        limit: Int,
                        sortBy: String,
                        locale: String,
                        completionHandler: @escaping ([BusinessInformation]?, Error?) -> Void) {
        let appSecret = "6hguexb3FmGuqh6mwkSouX46D7HnPGkl63GKaqvPhM-mELhyRNH9BthtIOGwsQg_8X6edpGfsKYRllR2ITIj1PXb1duVwhysxvr1k6SLrnZ2IqS5uGS1MxFL_2jQXnYx"
        //create baseurl
        let baseURL = "https://api.yelp.com/v3/businesses/search?latitude=\(latitude)&longitude=\(longitude)&categories=\(category)&limit=\(limit)&sort_by=\(sortBy)&locale=\(locale)"
        let url = URL(string: baseURL)
        
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(appSecret)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            if let error = error {
                completionHandler(nil, error)
            }
            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                let yelpProperties = try self.decoder.decode(YelpProperties.self, from: data!)
                print(yelpProperties.businesses[0].name)
//
//                guard let resp = json as? NSDictionary else {return}
//
//                guard let businesses = resp.value(forKey: "Businesses") as? [NSDictionary] else { return }
                
                var venuesList: [BusinessInformation] = []
                
                
                for business in yelpProperties.businesses {
                    let convertProperties = BusinessInformation()
                    convertProperties.name = business.name
                    venuesList.append(convertProperties)
                }

                
                completionHandler(venuesList, nil)
                
            } catch {
                print(error)
            }
        }.resume()
        
    }
    
}

