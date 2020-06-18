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
    var addressHorizontalStack = UIStackView()
    var restaurantName = PaddedCustomLabel()
    var ratingImageView = UIImageView()

    var ratingLabel = PaddedCustomLabel()
    var generalInfoHorizontalStack = UIStackView()
    var generalInfoSpacer1 = PaddedCustomLabel()
    var generalInfoSpacer2 = PaddedCustomLabel()
    var location = PaddedCustomLabel()
    var priceRange = PaddedCustomLabel()
    var foodType = PaddedCustomLabel()
    
    var streetAddress = PaddedCustomLabel()
    var distanceLabel = PaddedCustomLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        mainVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        restaurantName.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        streetAddress.translatesAutoresizingMaskIntoConstraints = false
        ratingHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        generalInfoSpacer1.translatesAutoresizingMaskIntoConstraints = false
        generalInfoSpacer2.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        mainVerticalStack.axis = .vertical
        
        addSubview(mainVerticalStack)
        restaurantName.type = .title
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
        generalInfoSpacer1.text = "•"
        
        mainVerticalStack.addArrangedSubview(generalInfoHorizontalStack)
        
        addressHorizontalStack.axis = .horizontal
        mainVerticalStack.addArrangedSubview(addressHorizontalStack)
        addressHorizontalStack.addArrangedSubview(streetAddress)
        generalInfoSpacer2.text = "•"
        addressHorizontalStack.addArrangedSubview(generalInfoSpacer2)
        addressHorizontalStack.addArrangedSubview(distanceLabel)
        generalInfoHorizontalStack.addArrangedSubview(priceRange)
        generalInfoHorizontalStack.addArrangedSubview(generalInfoSpacer1)
        generalInfoHorizontalStack.addArrangedSubview(foodType)

        
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
            ratingImageView.leadingAnchor.constraint(equalTo: restaurantName.leadingAnchor, constant: 10),
            ratingImageView.widthAnchor.constraint(equalToConstant: 100 )
        ])
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: ratingImageView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            priceRange.leadingAnchor.constraint(equalTo: restaurantName.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            generalInfoSpacer1.leadingAnchor.constraint(equalTo: priceRange.trailingAnchor )
        ])
        NSLayoutConstraint.activate([
           foodType.leadingAnchor.constraint(equalTo: generalInfoSpacer1.trailingAnchor )
        ])
        
        NSLayoutConstraint.activate([
           generalInfoSpacer2.leadingAnchor.constraint(equalTo: streetAddress.trailingAnchor )
        ])

        NSLayoutConstraint.activate([
           distanceLabel.leadingAnchor.constraint(equalTo: generalInfoSpacer2.trailingAnchor )
        ])
        
        
        
    }

}
