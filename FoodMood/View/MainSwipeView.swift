//
//  MainSwipeView.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//
import Foundation
import UIKit

class MainSwipeView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let cardView = CardView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 172/255, green: 252/255, blue: 217/255, alpha: 1)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.layer.cornerRadius = 50
        addSubview(cardView)
        
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardView.widthAnchor.constraint(equalToConstant: 250),
            cardView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }

}
