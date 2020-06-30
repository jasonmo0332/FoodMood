//
//  CustomLabel.swift
//  FoodMood
//
//  Created by Jason Mo on 5/28/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class CustomLabel : UILabel {
    
    
    enum LabelType {
        case title
        case subtitle
    }
    
    var type: LabelType? {
        didSet {
            switch type {
            case .title:
                textColor = .black
                font = UIFont.boldSystemFont(ofSize: 20.0)
                lineBreakMode = NSLineBreakMode.byWordWrapping
                numberOfLines = 0
            case .subtitle:
                textColor = .lightGray
                font = UIFont.systemFont(ofSize: 12)
            default:
                break
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .black
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
