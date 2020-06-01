//
//  SuggestionTableViewCell.swift
//  FoodMood
//
//  Created by Jason Mo on 5/31/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {

    var mainVerticalStack = UIStackView()
    var photoHorizontalStack = UIStackView()
    var ratingHorizontalStack = UIStackView()
    var restaurantName = CustomLabel()
    var ratingImageView = UIImageView()
    var ratingImage = UIImage()
    var ratingLabel = CustomLabel()
    var generalInfoHorizontalStack = UIStackView()
    var location = CustomLabel()
    var priceRange = CustomLabel()
    var foodType = CustomLabel()
    var hoursOfOp = CustomLabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        mainVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        restaurantName.translatesAutoresizingMaskIntoConstraints = false
        ratingHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        mainVerticalStack.axis = .vertical
        addSubview(mainVerticalStack)
        restaurantName.textAlignment = .left
        mainVerticalStack.addArrangedSubview(restaurantName)
        mainVerticalStack.addSubview(ratingHorizontalStack)
        ratingHorizontalStack.axis = .horizontal
        ratingHorizontalStack.addArrangedSubview(ratingImageView)
        ratingHorizontalStack.addArrangedSubview(ratingLabel)
        generalInfoHorizontalStack.axis = .horizontal
        mainVerticalStack.addSubview(generalInfoHorizontalStack)
        generalInfoHorizontalStack.addArrangedSubview(priceRange)
        generalInfoHorizontalStack.addArrangedSubview(foodType)
        mainVerticalStack.addArrangedSubview(hoursOfOp)
        
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainVerticalStack.topAnchor.constraint(equalTo: topAnchor),
            mainVerticalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainVerticalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainVerticalStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            ratingHorizontalStack.topAnchor.constraint(equalTo: topAnchor),
            ratingHorizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            ratingHorizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            ratingHorizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            generalInfoHorizontalStack.topAnchor.constraint(equalTo: topAnchor),
            generalInfoHorizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            generalInfoHorizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            generalInfoHorizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
