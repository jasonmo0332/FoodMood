//
//  RestaurantView.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class RestaurantView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var mainVerticalStack = UIStackView()
    var informationHorizontalStack = UIStackView()
    var callButon = UIButton()
    var visitYelpPage = UIButton()
    
    var fullAddress = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        mainVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        mainVerticalStack.axis = .vertical
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupConstraints() {
        
    }
}
