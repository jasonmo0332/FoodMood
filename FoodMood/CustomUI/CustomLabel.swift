//
//  CustomLabel.swift
//  FoodMood
//
//  Created by Jason Mo on 5/28/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class CustomLabel : UILabel {
    
    var topInset: CGFloat = 2.0
    var bottomInset: CGFloat = 5.0
    var leftInset: CGFloat = 10.0
    var rightInset: CGFloat = 0
    
    enum LabelType {
        case title
        case subtitle
    }
    
    var type: LabelType? {
        didSet {
            switch type {
            case .title:
                textColor = .black
                font = UIFont.systemFont(ofSize: 16)
            case .subtitle:
                textColor = .darkGray
                font = UIFont.systemFont(ofSize: 12)
            default:
                break
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
