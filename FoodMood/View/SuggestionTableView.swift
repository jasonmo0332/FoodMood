//
//  SuggestionTableView.swift
//  FoodMood
//
//  Created by Jason Mo on 5/31/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class SuggestionTableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

        backgroundColor = UIColor(red: 93/255, green: 152/255, blue: 233/255, alpha: 1)
        self.register(SuggestionTableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
