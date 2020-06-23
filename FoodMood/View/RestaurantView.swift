//
//  RestaurantView.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
import UIKit

class RestaurantView: UIView {

    
    
    var callButton = CustomButton()
    var visitYelpPageButton = CustomButton()
    var mapAddressButton = CustomButton()
    var addressLabel = CustomLabel()
    var restaurantName = PaddedCustomLabel()
    var callButtonImage = UIImage(named: "phone")
    var visitYelpPageImage = UIImage(named: "internet")
    var mapAddressButtonImage = UIImage(named: "map")
    var callLabel = CustomLabel()
    var viewMapLabel = CustomLabel()
    var viewYelpPageLabel = CustomLabel()
    var yelpRatingImageView = UIImageView()
    var numberOfRatingsLabel = PaddedCustomLabel()
    var isBusinessCurrentlyOpenLabel = PaddedCustomLabel()
    
    var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let photoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photoCollectionView.backgroundColor = .clear
        photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photoCollectionView.contentInsetAdjustmentBehavior = .automatic
        return photoCollectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        photoCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        
        photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        restaurantName.translatesAutoresizingMaskIntoConstraints = false
        yelpRatingImageView.translatesAutoresizingMaskIntoConstraints = false
        numberOfRatingsLabel.translatesAutoresizingMaskIntoConstraints = false
        callButton.translatesAutoresizingMaskIntoConstraints = false
        visitYelpPageButton.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        viewMapLabel.translatesAutoresizingMaskIntoConstraints = false
        viewYelpPageLabel.translatesAutoresizingMaskIntoConstraints = false
        callLabel.translatesAutoresizingMaskIntoConstraints = false
        mapAddressButton.translatesAutoresizingMaskIntoConstraints = false
        isBusinessCurrentlyOpenLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        setupButtons()
        setupLabels()
        setupImageView()
        addSubview(photoCollectionView)
        addSubview(restaurantName)
        
        
        addSubview(callButton)
        addSubview(visitYelpPageButton)
        addSubview(mapAddressButton)
        addSubview(viewYelpPageLabel)
        addSubview(viewMapLabel)
        addSubview(callLabel)
        addSubview(yelpRatingImageView)
        addSubview(numberOfRatingsLabel)
        addSubview(isBusinessCurrentlyOpenLabel)
        addSubview(addressLabel)
        
        
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButtons() {
        callButton.setImage(callButtonImage, for: .normal)
        visitYelpPageButton.setImage(visitYelpPageImage, for: .normal)
        mapAddressButton.setImage(mapAddressButtonImage, for: .normal)
        addressLabel.text = "Testing Address Label"
        callLabel.text = "Call"
        callLabel.type = .subtitle
        callLabel.textAlignment = .center
        viewMapLabel.text = "Map"
        viewMapLabel.type = .subtitle
        viewMapLabel.textAlignment = .center
        viewYelpPageLabel.text = "View on Yelp"
        viewYelpPageLabel.textAlignment = .center
        viewYelpPageLabel.type = .subtitle
    }
    
    func setupLabels() {
        restaurantName.type = .title
        restaurantName.backgroundColor = .clear
        restaurantName.textColor = .white
        restaurantName.layer.shadowOpacity = 0.5
        restaurantName.layer.shadowRadius = 0.5
        restaurantName.layer.shadowColor = UIColor.black.cgColor
        restaurantName.layer.shadowOffset = CGSize(width: 1, height: 1)
        restaurantName.layer.masksToBounds = false
        restaurantName.textAlignment = .left
        
        numberOfRatingsLabel.textAlignment = .left
        numberOfRatingsLabel.backgroundColor = .clear
        numberOfRatingsLabel.textColor = .white
        numberOfRatingsLabel.layer.shadowOpacity = 0.5
        numberOfRatingsLabel.layer.shadowRadius = 0.5
        numberOfRatingsLabel.layer.shadowColor = UIColor.black.cgColor
        numberOfRatingsLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
        numberOfRatingsLabel.layer.masksToBounds = false
        
        isBusinessCurrentlyOpenLabel.backgroundColor = .clear
    }
    
    func setupImageView() {
        yelpRatingImageView.contentMode = .scaleAspectFit
        yelpRatingImageView.clipsToBounds = true
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            restaurantName.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            restaurantName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -180),
            restaurantName.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantName.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            callButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -100),
            callButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            callButton.widthAnchor.constraint(equalToConstant: 32),
            callButton.heightAnchor.constraint(equalToConstant: 32)
            
        ])
        
        NSLayoutConstraint.activate([
            mapAddressButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            mapAddressButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            mapAddressButton.widthAnchor.constraint(equalToConstant: 32),
            mapAddressButton.heightAnchor.constraint(equalToConstant: 32)
        
        ])
        NSLayoutConstraint.activate([
            visitYelpPageButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 100),
            visitYelpPageButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            visitYelpPageButton.widthAnchor.constraint(equalToConstant: 32),
            visitYelpPageButton.heightAnchor.constraint(equalToConstant: 32)
        
        ])
        NSLayoutConstraint.activate([
            viewMapLabel.topAnchor.constraint(equalTo: mapAddressButton.bottomAnchor),
            viewMapLabel.centerXAnchor.constraint(equalTo: mapAddressButton.centerXAnchor)

        ])
        NSLayoutConstraint.activate([
           viewYelpPageLabel.topAnchor.constraint(equalTo: visitYelpPageButton.bottomAnchor),
           viewYelpPageLabel.centerXAnchor.constraint(equalTo: visitYelpPageButton.centerXAnchor)
        ])
        
        
        //for labels
        NSLayoutConstraint.activate([
            callLabel.topAnchor.constraint(equalTo: callButton.bottomAnchor),
            callLabel.centerXAnchor.constraint(equalTo: callButton.centerXAnchor)
        
        ])

        NSLayoutConstraint.activate([
            photoCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoCollectionView.heightAnchor.constraint(equalToConstant: 300),
            photoCollectionView.topAnchor.constraint(equalTo: topAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
            yelpRatingImageView.topAnchor.constraint(equalTo: restaurantName.bottomAnchor, constant: 10),
            yelpRatingImageView.leadingAnchor.constraint(equalTo: restaurantName.leadingAnchor, constant: 10),
            yelpRatingImageView.widthAnchor.constraint(equalToConstant: 100),
            
            
        
        ])
        
        NSLayoutConstraint.activate([
            isBusinessCurrentlyOpenLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            isBusinessCurrentlyOpenLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -80),
            isBusinessCurrentlyOpenLabel.widthAnchor.constraint(equalToConstant: 300)
        
        ])
        NSLayoutConstraint.activate([
            numberOfRatingsLabel.leadingAnchor.constraint(equalTo: yelpRatingImageView.trailingAnchor),
            numberOfRatingsLabel.topAnchor.constraint(equalTo: yelpRatingImageView.topAnchor)
        ])
        

    }
}
