//
//  MainSwipeView.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//
import Foundation
import UIKit

class MainSwipeView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let cardView = CardView()
//    var refreshButton = CustomButton()
    //<div>Icons made by <a href="https://creativemarket.com/Becris" title="Becris">Becris</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
    
    
    
    var refreshButtonImage = UIImage(named: "refreshButton")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 195/255, green: 172/255, blue: 206/255, alpha: 1)
        cardView.translatesAutoresizingMaskIntoConstraints = false
//        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        cardView.layer.cornerRadius = 50
//        refreshButton.setImage(refreshButtonImage, for: .normal)
//        addSubview(refreshButton)
        cardView.backgroundColor = UIColor(red: 223/255, green: 217/255, blue: 226/255, alpha: 1)
        addSubview(cardView)
        
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardView.widthAnchor.constraint(equalToConstant: 250),
            cardView.heightAnchor.constraint(equalToConstant: 350)
        ])
        
//        NSLayoutConstraint.activate([
//            refreshButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -170),
//            refreshButton.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -300),
//            refreshButton.widthAnchor.constraint(equalToConstant: 32),
//            refreshButton.heightAnchor.constraint(equalToConstant: 32)
//
//        ])
    }

}
