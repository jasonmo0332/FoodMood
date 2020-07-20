//
//  SuggestionView.swift
//  FoodMood
//
//  Created by Jason Mo on 5/26/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class SuggestionView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var safeArea: UILayoutGuide! // for iphone 10
    var suggestionTableView = SuggestionTableView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 93/255, green: 152/255, blue: 233/255, alpha: 1)
        safeArea = self.layoutMarginsGuide
        suggestionTableView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(suggestionTableView)
        
        setupConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        suggestionTableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        suggestionTableView.topAnchor.constraint(equalTo: self.safeArea.topAnchor).isActive = true
        suggestionTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        suggestionTableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}



