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
    var photoImageView = UIImageView()
    var ratingHorizontalStack = UIStackView()
    var restaurantName = PaddedCustomLabel()
    var ratingImageView = UIImageView()

    var ratingLabel = PaddedCustomLabel()
    var generalInfoHorizontalStack = UIStackView()
    var generalInfoSpacer = PaddedCustomLabel()
    var location = PaddedCustomLabel()
    var priceRange = PaddedCustomLabel()
    var foodType = PaddedCustomLabel()
    var hoursOfOp = PaddedCustomLabel()
    var streetAddress = PaddedCustomLabel()
    var distanceLabel = PaddedCustomLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        mainVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        restaurantName.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        streetAddress.translatesAutoresizingMaskIntoConstraints = false
        ratingHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        generalInfoSpacer.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        mainVerticalStack.axis = .vertical
        addSubview(mainVerticalStack)
        restaurantName.textAlignment = .left
        streetAddress.textAlignment = .left
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        ratingLabel.textAlignment = .left
        ratingLabel.sizeToFit()
        mainVerticalStack.addArrangedSubview(photoImageView)
        mainVerticalStack.addArrangedSubview(restaurantName)
        mainVerticalStack.addArrangedSubview(ratingHorizontalStack)
        ratingHorizontalStack.axis = .horizontal
        ratingImageView.contentMode = .scaleAspectFit
        ratingImageView.clipsToBounds = true
        
        ratingHorizontalStack.addArrangedSubview(ratingImageView)
        ratingHorizontalStack.addArrangedSubview(ratingLabel)
        generalInfoHorizontalStack.axis = .horizontal
        generalInfoSpacer.text = "•"
        mainVerticalStack.addArrangedSubview(generalInfoHorizontalStack)
        mainVerticalStack.addArrangedSubview(streetAddress)
        generalInfoHorizontalStack.addArrangedSubview(priceRange)
        generalInfoHorizontalStack.addArrangedSubview(generalInfoSpacer)
        generalInfoHorizontalStack.addArrangedSubview(foodType)
        mainVerticalStack.addArrangedSubview(hoursOfOp)
        mainVerticalStack.addArrangedSubview(distanceLabel)
        
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
        
        ])
//        NSLayoutConstraint.activate([
//            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
//
//
//        ])
        
//        NSLayoutConstraint.activate([
//            ratingHorizontalStack.topAnchor.constraint(equalTo: ),
//            ratingHorizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
//            ratingHorizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
//            ratingHorizontalStack.bottomAnchor.constraint(equalTo: generalInfoHorizontalStack.topAnchor)
//        ])
//        NSLayoutConstraint.activate([
//            generalInfoHorizontalStack.topAnchor.constraint(equalTo: ratingHorizontalStack.bottomAnchor),
//            generalInfoHorizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
//            generalInfoHorizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
//            generalInfoHorizontalStack.bottomAnchor.constraint(equalTo: mainVerticalStack.bottomAnchor)
//        ])
    }

}
