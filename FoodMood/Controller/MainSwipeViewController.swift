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
   
    var category: String?
    

    
    let foodCategories = FoodCategories()
    
    
    let hapticFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //randomize the category of food to start
        mainSwipeView.cardView.foodCategoryLabel.text = randomizeCategory()
        
        //setup pan gesture
        createPanGestureRecognizer(targetView: mainSwipeView.cardView)
        
        
        
        
    }

    override func loadView() {
        view = mainSwipeView
    }
    
    
    // The Pan Gesture
    func createPanGestureRecognizer(targetView: UIView) {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureValueChanged(_:)))
        targetView.addGestureRecognizer(panGesture)
        
    }
    
    @objc func refreshButtonDidPressed(sender: Any) {
        
        foodCategories.refreshFoodCategories()
        self.mainSwipeView.cardView.foodCategoryLabel.text = randomizeCategory()
    }
    
    //https://insights.nimblechapps.com/app-development/ios-app-development/how-to-make-tinder-like-swipe-gesture-for-ios help with tinder-like swipe
    @objc func panGestureValueChanged(_ sender: UIPanGestureRecognizer) {
        
        //this card view is what is passed in not the view
        let cardView = sender.view!
        let originalY = cardView.center.y
        let translationPoint = sender.translation(in: view)
        cardView.center = CGPoint(x: view.center.x+translationPoint.x, y: originalY)
          
        let distanceMoved = cardView.center.x - view.center.x

        //rotates the card
        cardView.transform = CGAffineTransform(rotationAngle: distanceMoved/(view.frame.size.width/2)/1.5)
        
        if sender.state == UIGestureRecognizer.State.ended {
            if cardView.center.x < 20 { // Moved to left
                UIView.animate(withDuration: 0.3, animations: {
                    cardView.center = CGPoint(x: cardView.center.x-200, y: cardView.center.y)
                    
                })
                //new card slides back
                UIView.animate(withDuration: 1.8, animations: {
                    self.hapticFeedbackGenerator.impactOccurred()
                    self.setupNewCard()
                })
                
                return
                
            }
            
            else if (cardView.center.x > (view.frame.size.width-20)) { // Moved to right
               UIView.animate(withDuration: 0.3, animations: {
                    cardView.center = CGPoint(x: cardView.center.x+200, y: cardView.center.y)
                    
               })
                
                guard let currentFoodCategory = mainSwipeView.cardView.foodCategoryLabel.text else { return }
                let suggestionViewController = SuggestionViewController()
                
                suggestionViewController.category = retrieveFoodCategoryQueryEquiavlent(currentFoodCategory: currentFoodCategory)
                suggestionViewController.categoryName = currentFoodCategory
                
                hapticFeedbackGenerator.impactOccurred()
                self.navigationController?.pushViewController(suggestionViewController, animated: true)
                CustomLocationManager.shared.stopMySignificantLocationChanges()
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
    
    func retrieveFoodCategoryQueryEquiavlent(currentFoodCategory: String) -> String? {
        guard let currentQuery = foodCategories.foodCategoriesQueryDictionary[currentFoodCategory] else { return "" }
        return currentQuery
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
        if foodCategories.foodCategories.count == 0 {
            foodCategories.refreshFoodCategories()
        }
        let remainingSize = foodCategories.foodCategories.count
        let randomIndex = randomNumberGenerator(arraySize: remainingSize)
        let currentChoice = foodCategories.foodCategories[randomIndex] //grabs currentchoice
        foodCategories.foodCategories.remove(at: randomIndex) //removes current choice
        return currentChoice
        
    }

    
    func randomNumberGenerator(arraySize : Int) -> Int {
        let randomNumber = Int.random(in: 0..<arraySize)
        return randomNumber
    }
    
    

}
//animations
extension MainSwipeViewController:  UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self as? UIViewControllerAnimatedTransitioning
    }
}




