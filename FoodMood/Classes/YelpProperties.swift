//
//  YelpProperties.swift
//  FoodMood
//
//  Created by Jason Mo on 6/1/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation

class YelpProperties {
    var restaurantName : String
    var rating : String
    var location : String
    var priceRange: String
    var foodType : String
    var hoursOfOp : String
    init(restaurantName : String, rating : String, location : String, priceRange: String, foodType : String, hoursOfOp : String) {
        self.restaurantName = restaurantName
        self.rating = rating
        self.location = location
        self.priceRange = priceRange
        self.foodType = foodType
        self.hoursOfOp = hoursOfOp
    }
}
