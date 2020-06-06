//
//  YelpBusinessSearchIdResponse.swift
//  FoodMood
//
//  Created by Jason Mo on 6/4/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
//https://www.yelp.com/developers/documentation/v3/business

struct YelpBusinessSearchIdResponse {
    let id : String?
    let alias : String?
    let name: String?
    let imageUrl: String?
    let isClaimed: String?
    let url: String?
    let phone: String?
    let displayPhone: String?
    let reviewCount: String?
    let categories: [YelpBusinessSearchIdCategory]?
    let rating: Double?
    let location : YelpBusinessSearchLocationCategory?
    let coordinates : YelpBusinessSearchLocationCoordinates?
    let photos : [String]?
    let price : String?
    let hours: [YelpBusinessSearchLocationOpen]?
    let transctions : [String]
    let specialHours: [YelpBusinessSearchLocationSpecialHours]?
    
}

struct YelpBusinessSearchIdCategory {
    let alias : String?
    let title : String?
}

struct YelpBusinessSearchLocationCategory {
    let address1 : String?
    let address2 : String?
    let address3 : String?
    let city : String?
    let zipCode : String?
    let country: String?
    let state: String?
    let displayAddress : [String]?
    let crossStreets : String?
}


struct YelpBusinessSearchLocationCoordinates {
    let latitude: Double?
    let longitude: Double?
}

struct YelpBusinessSearchLocationOpen {
    let isOvernight : Bool?
    let start : String?
    let end : String?
    let day : Int?
    let hoursType : String?
    let isOpenNow : Bool?
}

struct YelpBusinessSearchLocationSpecialHours {
    let date : String?
    let isClosed : Bool?
    let start : String?
    let end : String?
    let isOvernight : Bool?
}




