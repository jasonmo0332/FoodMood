//
//  YelpPropertiesFactory.swift
//  FoodMood
//
//  Created by Jason Mo on 6/1/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
class YelpPropertiesFactory {
    static func generateStaticYelpProperties() -> [YelpProperties] {
        var yelpProperties : [YelpProperties] = []
        
        
        yelpProperties.append(YelpProperties.init(restaurantName: "Testing", rating: "4", location: "123 Wild'n Street", priceRange: "$$", foodType: "Yummy", hoursOfOp: "10am - 5pm"))
        yelpProperties.append(YelpProperties.init(restaurantName: "Testing", rating: "4", location: "123 Wild'n Street", priceRange: "$$", foodType: "Yummy", hoursOfOp: "10am - 5pm"))
        yelpProperties.append(YelpProperties.init(restaurantName: "Testing", rating: "4", location: "123 Wild'n Street", priceRange: "$$", foodType: "Yummy", hoursOfOp: "10am - 5pm"))
        yelpProperties.append(YelpProperties.init(restaurantName: "Testing", rating: "4", location: "123 Wild'n Street", priceRange: "$$", foodType: "Yummy", hoursOfOp: "10am - 5pm"))
        yelpProperties.append(YelpProperties.init(restaurantName: "Testing", rating: "4", location: "123 Wild'n Street", priceRange: "$$", foodType: "Yummy", hoursOfOp: "10am - 5pm"))
        
        
        
        return yelpProperties
    }
}
