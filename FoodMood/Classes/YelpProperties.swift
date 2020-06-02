//
//  YelpProperties.swift
//  FoodMood
//
//  Created by Jason Mo on 6/2/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation

struct YelpProperties : Codable {
    let businesses : [Businesses]
}

struct Businesses: Codable {
    let name : String
    let rating : Float?
    let price: String?
    let location: Location
}

struct Location: Codable {
    let address1 : String
}
