//
//  CardView.swift
//  FoodMood
//
//  Created by Jason Mo on 5/28/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    
    var foodCategoryLabel = CustomLabel()
    var imageViewIcon1 = UIImageView()
    var imageIcon1 = UIImage(named: "sushi")
    var imageViewIcon2 = UIImageView()
    var imageIcon2 = UIImage(named: "fast-food")
    var imageViewIcon3 = UIImageView()
    var imageIcon3 = UIImage(named: "snack")
    var imageViewIcon4 = UIImageView()
    var imageIcon4 = UIImage(named: "samosa")
    var imageViewIcon5 = UIImageView()
    var imageIcon5 = UIImage(named: "dimsum")
    var imageViewIcon6 = UIImageView()
    var imageIcon6 = UIImage(named: "burger")
    
    //salad Icon
    //<div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
    
    //burger icon
    //Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
    
    //dimsum icon
    //<div>Icons made by <a href="https://www.flaticon.com/authors/good-ware" title="Good Ware">Good Ware</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
    //sushi icon
    //<div>Icons made by <a href="https://www.flaticon.com/authors/iconixar" title="iconixar">iconixar</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
    
    //indian food
    //<div>Icons made by <a href="https://www.flaticon.com/authors/smashicons" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
    
    //taco
    //<div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
    //pizza icon
    //<div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 2
        let borderColor = UIColor(red: 89/255, green: 63/255, blue: 98/255, alpha: 1)
        layer.borderColor = borderColor.cgColor
        layer.masksToBounds = true
        imageViewIcon1.translatesAutoresizingMaskIntoConstraints = false
        imageViewIcon2.translatesAutoresizingMaskIntoConstraints = false
        imageViewIcon3.translatesAutoresizingMaskIntoConstraints = false
        imageViewIcon4.translatesAutoresizingMaskIntoConstraints = false
        imageViewIcon5.translatesAutoresizingMaskIntoConstraints = false
        imageViewIcon6.translatesAutoresizingMaskIntoConstraints = false
        foodCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        foodCategoryLabel.textAlignment = .center
        foodCategoryLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        foodCategoryLabel.numberOfLines = 0
        imageViewIcon1.image = imageIcon1
        imageViewIcon2.image = imageIcon2
        imageViewIcon3.image = imageIcon3
        imageViewIcon4.image = imageIcon4
        imageViewIcon5.image = imageIcon5
        imageViewIcon6.image = imageIcon6

        addSubview(foodCategoryLabel)
        addSubview(imageViewIcon1)
        addSubview(imageViewIcon2)
        addSubview(imageViewIcon3)
        addSubview(imageViewIcon4)
        addSubview(imageViewIcon5)
        addSubview(imageViewIcon6)
        
        
        setupConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            foodCategoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            foodCategoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            foodCategoryLabel.widthAnchor.constraint(equalToConstant: 150),
            foodCategoryLabel.heightAnchor.constraint(equalToConstant: 75)
        ])
        NSLayoutConstraint.activate([
            imageViewIcon1.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 50),
            imageViewIcon1.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50),
            imageViewIcon1.widthAnchor.constraint(equalToConstant: 32),
            imageViewIcon1.heightAnchor.constraint(equalToConstant: 32)
        ])
        NSLayoutConstraint.activate([
            imageViewIcon2.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 50),
            imageViewIcon2.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            imageViewIcon2.widthAnchor.constraint(equalToConstant: 32),
            imageViewIcon2.heightAnchor.constraint(equalToConstant: 32)
        ])
        NSLayoutConstraint.activate([
            imageViewIcon3.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -50),
            imageViewIcon3.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            imageViewIcon3.widthAnchor.constraint(equalToConstant: 32),
            imageViewIcon3.heightAnchor.constraint(equalToConstant: 32)
        ])
        NSLayoutConstraint.activate([
            imageViewIcon4.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -50),
            imageViewIcon4.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50),
            imageViewIcon4.widthAnchor.constraint(equalToConstant: 32),
            imageViewIcon4.heightAnchor.constraint(equalToConstant: 32)
        ])
        NSLayoutConstraint.activate([
            imageViewIcon5.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageViewIcon5.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            imageViewIcon5.widthAnchor.constraint(equalToConstant: 32),
            imageViewIcon5.heightAnchor.constraint(equalToConstant: 32)
        ])
        NSLayoutConstraint.activate([
            imageViewIcon6.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageViewIcon6.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50),
            imageViewIcon6.widthAnchor.constraint(equalToConstant: 32),
            imageViewIcon6.heightAnchor.constraint(equalToConstant: 32)
        ])
        

    }
}
