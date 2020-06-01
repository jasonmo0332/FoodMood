//
//  CardViewController.swift
//  FoodMood
//
//  Created by Jason Mo on 5/28/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    let cardView = CardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createPanGestureRecognizer(targetView: cardView)
        print("hello")
    }
    override func loadView() {
        view = cardView
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
        let translationPoint = sender.translation(in: view)
        cardView.center = CGPoint(x: view.center.x+translationPoint.x, y: view.center.y+translationPoint.y)
          
        let distanceMoved = cardView.center.x - view.center.x
        if distanceMoved > 0 { // moved right side
            print("Yes")
//            cardView.transform = CGAffineTransform(rotationAngle: distanceMoved/divisionParam)
        }
        else { // moved left side
            print("No")
//            cardView.transform = CGAffineTransform(rotationAngle: distanceMoved/divisionParam)
        }
          
        
        
        if sender.state == UIGestureRecognizer.State.ended {
            if cardView.center.x < 20 { // Moved to left
                UIView.animate(withDuration: 0.3, animations: {
                    cardView.center = CGPoint(x: cardView.center.x-200, y: cardView.center.y)
                })
                return
            }
            else if (cardView.center.x > (view.frame.size.width-20)) { // Moved to right
                UIView.animate(withDuration: 0.3, animations: {
                    cardView.center = CGPoint(x: cardView.center.x+200, y: cardView.center.y)
                })
                return
            }
              
            UIView.animate(withDuration: 0.2, animations: {
                cardView.center = self.view.center
                print("Reached Here")
                self.cardView.foodCategoryLabel.text = "Changed"
            })
        }
    }
    
    func randomizeCard() {
        
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
