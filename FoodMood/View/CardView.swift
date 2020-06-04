//
//  CardView.swift
//  FoodMood
//
//  Created by Jason Mo on 5/28/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var foodCategoryLabel = CustomLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        foodCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        foodCategoryLabel.textAlignment = .center
        addSubview(foodCategoryLabel)
        
        setupConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            foodCategoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            foodCategoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            foodCategoryLabel.widthAnchor.constraint(equalToConstant: 100),
            foodCategoryLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
}
