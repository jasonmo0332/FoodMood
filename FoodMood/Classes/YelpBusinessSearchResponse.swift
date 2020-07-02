//
//  YelpProperties.swift
//  FoodMood
//
//  Created by Jason Mo on 6/2/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation

// https://www.yelp.com/developers/documentation/v3/business_search
struct YelpBusinessSearchResponse : Codable {
    let total: Int
    let businesses: [YelpBusiness]
    let region: YelpRegion
}

struct YelpBusiness: Codable {
    let rating : Float?
    let price: String?
    let phone: String?
    let id: String?
    let alias: String?
    let isClosed: Bool?
    let categories: [YelpCategory]
    let reviewCount: Int?
    let name : String?
    let url: String?
    let coordinates: YelpCoordinates
    let imageUrl: String?
    let location: YelpLocation
    let distance: Double?
    let transactions: [String]?
}

struct YelpCoordinates: Codable {
    let latitude: Double?
    let longitude: Double?
}

struct YelpCategory: Codable {
    let alias: String?
    let title: String?
}

struct YelpLocation: Codable {
    let city: String?
    let country: String?
    let address2: String?
    let address3: String?
    let state: String?
    let address1: String?
    let zipCode: String?
}

struct YelpRegion: Codable {
    let center: YelpCoordinates
}




