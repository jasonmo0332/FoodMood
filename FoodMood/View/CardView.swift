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
//    var foodCategoryIconImageView = UIImageView()
//    var foodCategoryIconImage = UIImage(named: "phFlag")
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 5
        layer.borderColor = UIColor.black.cgColor
        foodCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
//        foodCategoryIconImageView.translatesAutoresizingMaskIntoConstraints = false
        foodCategoryLabel.textAlignment = .center
//        foodCategoryIconImageView.image = foodCategoryIconImage
//        foodCategoryIconImageView.contentMode = .scaleAspectFit
//        addSubview(foodCategoryIconImageView)
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
        
//        NSLayoutConstraint.activate([
//            foodCategoryIconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            foodCategoryIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
//            foodCategoryIconImageView.widthAnchor.constraint(equalToConstant: 100),
//            foodCategoryIconImageView.heightAnchor.constraint(equalToConstant: 100)
//        ])
//
    }
}
