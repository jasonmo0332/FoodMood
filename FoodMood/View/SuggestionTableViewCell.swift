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
//    var ratingImage1 = UIImage(named: "rating1")
//    var ratingImage1Half = UIImage(named: "rating1Half")
//    var ratingImage2 = UIImage(named: "rating2")
//    var ratingImage2Half = UIImage(named: "rating2Half")
//    var ratingImage3 = UIImage(named: "rating3")
//    var ratingImage3Half = UIImage(named: "rating3Half")
//    var ratingImage4 = UIImage(named: "rating4")
//    var ratingImage4Half = UIImage(named: "rating4Half")
//    var ratingImage5 = UIImage(named: "rating5")
    var ratingLabel = CustomLabel()
    var generalInfoHorizontalStack = UIStackView()
    var location = CustomLabel()
    var priceRange = CustomLabel()
    var foodType = CustomLabel()
    var hoursOfOp = CustomLabel()
    var streetAddress = CustomLabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        mainVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        restaurantName.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        streetAddress.translatesAutoresizingMaskIntoConstraints = false
        ratingHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        mainVerticalStack.axis = .vertical
        addSubview(mainVerticalStack)
        restaurantName.textAlignment = .left
        streetAddress.textAlignment = .left
        mainVerticalStack.addArrangedSubview(photoHorizontalStack)
        mainVerticalStack.addArrangedSubview(restaurantName)
        mainVerticalStack.addArrangedSubview(ratingHorizontalStack)
        ratingHorizontalStack.axis = .horizontal
        ratingHorizontalStack.addArrangedSubview(ratingImageView)
        ratingHorizontalStack.addArrangedSubview(ratingLabel)
        generalInfoHorizontalStack.axis = .horizontal
        mainVerticalStack.addSubview(generalInfoHorizontalStack)
        mainVerticalStack.addArrangedSubview(streetAddress)
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
