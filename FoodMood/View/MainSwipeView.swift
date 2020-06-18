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
    var refreshButton = CustomButton()
    //<div>Icons made by <a href="https://creativemarket.com/Becris" title="Becris">Becris</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
    var refreshButtomImage = UIImage(named: "refreshButton")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.layer.cornerRadius = 50
        refreshButton.setImage(refreshButtomImage, for: .normal)
        addSubview(refreshButton)
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
            cardView.widthAnchor.constraint(equalToConstant: 200),
            cardView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        NSLayoutConstraint.activate([
            refreshButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -50),
            refreshButton.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -100),
            refreshButton.widthAnchor.constraint(equalToConstant: 32),
            refreshButton.heightAnchor.constraint(equalToConstant: 32)
            
        
        
        
        ])
    }

}
