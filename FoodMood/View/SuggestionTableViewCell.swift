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
    var restaurantName = CustomLabel()
    var ratingImageView = UIImageView()

    var ratingLabel = CustomLabel()
    var generalInfoHorizontalStack = UIStackView()
    var generalInfoSpacer1 = CustomLabel()
    var generalInfoSpacer2 = CustomLabel()
    var location = CustomLabel()
    var priceRange = CustomLabel()
    var foodType = CustomLabel()
    
    var streetAddress = CustomLabel()
    var distanceLabel = CustomLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 93/255, green: 152/255, blue: 233/255, alpha: 1)
        mainVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        restaurantName.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        streetAddress.translatesAutoresizingMaskIntoConstraints = false
        ratingHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        generalInfoHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        generalInfoSpacer1.translatesAutoresizingMaskIntoConstraints = false
        generalInfoSpacer2.translatesAutoresizingMaskIntoConstraints = false
        addressHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        mainVerticalStack.axis = .vertical
        mainVerticalStack.alignment = .leading
        mainVerticalStack.spacing = 5
        addSubview(photoImageView)
        addSubview(mainVerticalStack)
        restaurantName.type = .title
        restaurantName.textAlignment = .left
        streetAddress.textAlignment = .left
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        ratingLabel.textAlignment = .left
        ratingLabel.sizeToFit()
        
        
        mainVerticalStack.addArrangedSubview(restaurantName)
        
        mainVerticalStack.addArrangedSubview(ratingHorizontalStack)
        ratingHorizontalStack.axis = .horizontal
        ratingImageView.contentMode = .scaleAspectFit
        ratingImageView.clipsToBounds = true
        
        ratingHorizontalStack.addArrangedSubview(ratingImageView)
        ratingHorizontalStack.addArrangedSubview(ratingLabel)
        ratingHorizontalStack.spacing = 8
        generalInfoHorizontalStack.axis = .horizontal
        generalInfoSpacer1.text = "•"
        
        mainVerticalStack.addArrangedSubview(generalInfoHorizontalStack)
        
        addressHorizontalStack.axis = .horizontal
        addressHorizontalStack.spacing = 8
        mainVerticalStack.addArrangedSubview(addressHorizontalStack)
        addressHorizontalStack.addArrangedSubview(streetAddress)
        generalInfoSpacer2.text = "•"
        addressHorizontalStack.addArrangedSubview(generalInfoSpacer2)
        addressHorizontalStack.addArrangedSubview(distanceLabel)
        generalInfoHorizontalStack.addArrangedSubview(priceRange)
        generalInfoHorizontalStack.addArrangedSubview(generalInfoSpacer1)
        generalInfoHorizontalStack.addArrangedSubview(foodType)
        generalInfoHorizontalStack.spacing = 8
        
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
            photoImageView.topAnchor.constraint(equalTo: topAnchor),
            photoImageView.widthAnchor.constraint(equalTo: widthAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: 150)
        
        ])
        NSLayoutConstraint.activate([
            mainVerticalStack.topAnchor.constraint(equalTo: photoImageView.bottomAnchor),
            mainVerticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainVerticalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainVerticalStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
        
        NSLayoutConstraint.activate([
            
            ratingImageView.widthAnchor.constraint(equalToConstant: 100)
            
        ])
        
        NSLayoutConstraint.activate([
            
            
            
            
        ])

        
        
        
    }

}
