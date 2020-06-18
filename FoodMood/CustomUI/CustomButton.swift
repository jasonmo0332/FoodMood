//
//  CustomButton.swift
//  FoodMood
//
//  Created by Jason Mo on 6/9/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import UIKit

class CustomButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(.systemBlue, for: .normal)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
