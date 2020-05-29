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
        let leftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeMade(_:)))
        leftRecognizer.direction = .left
        let rightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeMade(_:)))
        rightRecognizer.direction = .right
        self.view.addGestureRecognizer(leftRecognizer)
        self.view.addGestureRecognizer(rightRecognizer)
        // Do any additional setup after loading the view.
        print("hello")
        
    }
    override func loadView() {
        view = cardView
    }
    
    
    
    
    
    
    @objc func swipeMade(_ sender: UISwipeGestureRecognizer) {
       if sender.direction == .left {
          print("left swipe made")
       }
       if sender.direction == .right {
          print("right swipe made")
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
