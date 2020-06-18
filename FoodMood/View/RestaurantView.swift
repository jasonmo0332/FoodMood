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
    var yelpPhotoImageView1 = UIImageView()
    var yelpPhotoImageView2 = UIImageView()
    var yelpPhotoImageView3 = UIImageView()
    
    var photoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        photoCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(photoCollectionView)
        
        backgroundColor = .white
        restaurantName.translatesAutoresizingMaskIntoConstraints = false
        callButton.translatesAutoresizingMaskIntoConstraints = false
        visitYelpPageButton.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        viewMapLabel.translatesAutoresizingMaskIntoConstraints = false
        viewYelpPageLabel.translatesAutoresizingMaskIntoConstraints = false
        callLabel.translatesAutoresizingMaskIntoConstraints = false
        mapAddressButton.translatesAutoresizingMaskIntoConstraints = false
        yelpPhotoImageView1.translatesAutoresizingMaskIntoConstraints = false
        yelpPhotoImageView2.translatesAutoresizingMaskIntoConstraints = false
        yelpPhotoImageView3.translatesAutoresizingMaskIntoConstraints = false
        
        yelpPhotoImageView1.contentMode = .scaleAspectFill
        yelpPhotoImageView2.contentMode = .scaleAspectFill
        yelpPhotoImageView3.contentMode = .scaleAspectFill
        yelpPhotoImageView1.clipsToBounds = true
        yelpPhotoImageView2.clipsToBounds = true
        yelpPhotoImageView3.clipsToBounds = true
        
        
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
        restaurantName.type = .title
        restaurantName.backgroundColor = .clear

        addSubview(restaurantName)
        
        restaurantName.textAlignment = .left
        addSubview(callButton)
        addSubview(visitYelpPageButton)
        addSubview(mapAddressButton)
        
        
        
        addSubview(viewYelpPageLabel)
        addSubview(viewMapLabel)
        addSubview(callLabel)
        addSubview(addressLabel)
        
        addSubview(yelpPhotoImageView1)
        addSubview(yelpPhotoImageView2)
        addSubview(yelpPhotoImageView3)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            restaurantName.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            restaurantName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -250),
            restaurantName.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantName.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            callButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -100),
            callButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
            callButton.widthAnchor.constraint(equalToConstant: 32),
            callButton.heightAnchor.constraint(equalToConstant: 32)
            
        ])
        
        NSLayoutConstraint.activate([
            mapAddressButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            mapAddressButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
            mapAddressButton.widthAnchor.constraint(equalToConstant: 32),
            mapAddressButton.heightAnchor.constraint(equalToConstant: 32)
        
        ])
        NSLayoutConstraint.activate([
            visitYelpPageButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 100),
            visitYelpPageButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
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
            photoCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            photoCollectionView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 150),
            photoCollectionView.widthAnchor.constraint(equalToConstant: 300),
            photoCollectionView.heightAnchor.constraint(equalToConstant: 300)
        
        ])
        
//        NSLayoutConstraint.activate([
//            yelpPhotoImageView1.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -100),
//            yelpPhotoImageView1.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 150),
//            yelpPhotoImageView1.widthAnchor.constraint(equalToConstant: 100),
//            yelpPhotoImageView1.heightAnchor.constraint(equalToConstant: 100)
//
//        ])
//
//        NSLayoutConstraint.activate([
//            yelpPhotoImageView2.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
//            yelpPhotoImageView2.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 150),
//            yelpPhotoImageView2.widthAnchor.constraint(equalToConstant: 100),
//            yelpPhotoImageView2.heightAnchor.constraint(equalToConstant: 100)
//
//        ])
        
//        NSLayoutConstraint.activate([
//            yelpPhotoImageView3.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 100),
//            yelpPhotoImageView3.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 150),
//            yelpPhotoImageView3.widthAnchor.constraint(equalToConstant: 100),
//            yelpPhotoImageView3.heightAnchor.constraint(equalToConstant: 100)
//
//        ])
    }
}
