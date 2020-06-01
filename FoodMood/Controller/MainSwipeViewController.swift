//
//  MainSwipeViewController.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit
import CoreLocation


class MainSwipeViewController: UIViewController, CLLocationManagerDelegate {
    
    let mainSwipeView = MainSwipeView()
//    var divisionParam: CGFloat!
    let suggestionViewController = SuggestionViewController()
    let foodCategories = FoodCategories()
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
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

               self.navigationController?.pushViewController(suggestionViewController, animated: false)
               UIView.animate(withDuration: 2, animations: {
                    self.setupSameCard()
                })
               
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
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    // do stuff
                }
            }
        }
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



extension MainSwipeViewController:  UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }
}
