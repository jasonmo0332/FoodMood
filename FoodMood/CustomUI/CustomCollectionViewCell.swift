//
//  CustomCollectionViewCell.swift
//  FoodMood
//
//  Created by Jason Mo on 6/16/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    var imageView = UIImageView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
//        imageView.image = UIImage(named: "rating2")
        addSubview(imageView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
    
}
