//
//  RestaurantView.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class RestaurantView: UIView {

    
    
    var callButton = CustomButton()
    var visitYelpPageButton = CustomButton()
    var mapAddressButton = CustomButton()
    var addressLabel = CustomLabel()
//    var restaurantName = PaddedCustomLabel()
    var restaurantName = CustomLabel()
    
    /*
     Call icon made by bqlqn from www.flaticon.com - https://www.flaticon.com/authors/bqlqn
     Map icon made by bqlqn from www.flaticon.com - https://www.flaticon.com/authors/bqlqn
     Web icon made by bqlqn from www.flaticon.com - https://www.flaticon.com/authors/bqlqn
     */
    
    
    
    var callButtonImage = UIImage(named: "phone")
    var visitYelpPageImage = UIImage(named: "internet")
    var mapAddressButtonImage = UIImage(named: "map")
    var callLabel = CustomLabel()
    var viewMapLabel = CustomLabel()
    var viewYelpPageLabel = CustomLabel()
    var yelpRatingImageView = UIImageView()
//    var numberOfRatingsLabel = PaddedCustomLabel()
    var numberOfRatingsLabel = CustomLabel()
//    var isBusinessCurrentlyOpenLabel = PaddedCustomLabel()
    var isBusinessCurrentlyOpenLabel = CustomLabel()
    var currentDayHoursLabel = CustomLabel()
    var buttonView = UIView()
    var mapView = MKMapView()
    var safeArea: UILayoutGuide!
    var addressInformationView = UIView()
    var directionsEta = CustomLabel()
    
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
        safeArea = self.layoutMarginsGuide
        photoCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
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
        currentDayHoursLabel.translatesAutoresizingMaskIntoConstraints = false
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        addressInformationView.translatesAutoresizingMaskIntoConstraints = false
        directionsEta.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonView)
//        buttonView.layer.borderWidth = 2
//        buttonView.layer.borderColor = UIColor.lightGray.cgColor
        buttonView.addSubview(callButton)
        buttonView.addSubview(visitYelpPageButton)
        buttonView.addSubview(mapAddressButton)
        buttonView.addSubview(viewYelpPageLabel)
        buttonView.addSubview(viewMapLabel)
        buttonView.addSubview(callLabel)
        
        buttonView.addSubview(isBusinessCurrentlyOpenLabel)
        
        buttonView.addSubview(currentDayHoursLabel)
        
        setupButtons()
        setupLabels()
        setupImageView()
        addSubview(photoCollectionView)
        addSubview(restaurantName)
        
        
        addSubview(yelpRatingImageView)
        addSubview(numberOfRatingsLabel)
        
        
        
        addSubview(mapView)
        
        addSubview(addressInformationView)
        
        addressInformationView.addSubview(directionsEta)
        addressInformationView.addSubview(addressLabel)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButtons() {
        callButton.setImage(callButtonImage, for: .normal)
        visitYelpPageButton.setImage(visitYelpPageImage, for: .normal)
        mapAddressButton.setImage(mapAddressButtonImage, for: .normal)
        
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
        currentDayHoursLabel.numberOfLines = 0
        currentDayHoursLabel.textAlignment = .left
        currentDayHoursLabel.textColor = .black
        addressLabel.type = .subtitle
        addressLabel.font = UIFont.systemFont(ofSize: 10)
        addressLabel.lineBreakMode = .byWordWrapping
        addressLabel.numberOfLines = 0
        directionsEta.type = .title
        directionsEta.textColor = .black
        
        addressLabel.text = ""
        
    }
    
    func setupImageView() {
        yelpRatingImageView.contentMode = .scaleAspectFit
        yelpRatingImageView.clipsToBounds = true
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
//            restaurantName.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            restaurantName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -180),
            restaurantName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            restaurantName.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(equalTo: photoCollectionView.bottomAnchor),
            buttonView.leadingAnchor.constraint(equalTo: photoCollectionView.leadingAnchor),
            buttonView.trailingAnchor.constraint(equalTo: photoCollectionView.trailingAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 125)
            
            
        ])
        
        NSLayoutConstraint.activate([
            isBusinessCurrentlyOpenLabel.leadingAnchor.constraint(equalTo: restaurantName.leadingAnchor),
            isBusinessCurrentlyOpenLabel.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: -40),
            isBusinessCurrentlyOpenLabel.widthAnchor.constraint(equalToConstant: 60)
        
        ])
        
        NSLayoutConstraint.activate([
            currentDayHoursLabel.widthAnchor.constraint(equalToConstant: 200),
            currentDayHoursLabel.leadingAnchor.constraint(equalTo: isBusinessCurrentlyOpenLabel.trailingAnchor),
            currentDayHoursLabel.topAnchor.constraint(equalTo: isBusinessCurrentlyOpenLabel.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: buttonView.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.widthAnchor.constraint(equalTo: widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            addressInformationView.topAnchor.constraint(equalTo: mapView.bottomAnchor),
            addressInformationView.widthAnchor.constraint(equalTo: widthAnchor),
            addressInformationView.heightAnchor.constraint(equalToConstant: 75),
            addressInformationView.bottomAnchor.constraint(equalTo: bottomAnchor),
            addressInformationView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
//            directionsEta.centerXAnchor.constraint(equalTo: addressInformationView.centerXAnchor, constant: -118),
            directionsEta.leadingAnchor.constraint(equalTo: restaurantName.leadingAnchor),
            directionsEta.centerYAnchor.constraint(equalTo: addressInformationView.centerYAnchor, constant: -10),
            
        ])
        
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: directionsEta.bottomAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: directionsEta.leadingAnchor),
            addressLabel.heightAnchor.constraint(equalToConstant: 25),
        ])
        
    
        
        NSLayoutConstraint.activate([
            callButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor, constant: -100),
            callButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: 20),
            callButton.widthAnchor.constraint(equalToConstant: 32),
            callButton.heightAnchor.constraint(equalToConstant: 32)
            
        ])
        
        NSLayoutConstraint.activate([
            mapAddressButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor, constant: 0),
            mapAddressButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: 20),
            mapAddressButton.widthAnchor.constraint(equalToConstant: 32),
            mapAddressButton.heightAnchor.constraint(equalToConstant: 32)
        
        ])
        NSLayoutConstraint.activate([
            visitYelpPageButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor, constant: 100),
            visitYelpPageButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: 20),
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
            
        
        ])
        photoCollectionView.topAnchor.constraint(equalTo: self.safeArea.topAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            yelpRatingImageView.topAnchor.constraint(equalTo: restaurantName.bottomAnchor, constant: 10),
            yelpRatingImageView.leadingAnchor.constraint(equalTo: restaurantName.leadingAnchor),
            yelpRatingImageView.widthAnchor.constraint(equalToConstant: 100),

        
        ])
        
        
        NSLayoutConstraint.activate([
            numberOfRatingsLabel.leadingAnchor.constraint(equalTo: yelpRatingImageView.trailingAnchor, constant: 10),
            numberOfRatingsLabel.topAnchor.constraint(equalTo: yelpRatingImageView.topAnchor, constant: 10)
        ])
        
        

    }
}
