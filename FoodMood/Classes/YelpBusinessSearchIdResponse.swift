//
//  YelpBusinessSearchIdResponse.swift
//  FoodMood
//
//  Created by Jason Mo on 6/4/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation
//https://www.yelp.com/developers/documentation/v3/business

struct YelpBusinessSearchIdResponse : Codable {
    let id : String?
    let alias : String?
    let name: String?
    let imageUrl: String?
    let isClaimed: Bool?
    let url: String?
    let phone: String?
    let displayPhone: String?
    let reviewCount: Int?
    let categories: [YelpBusinessSearchIdCategory]?
    let rating: Double?
    let location : YelpBusinessSearchLocationCategory?
    let coordinates : YelpBusinessSearchLocationCoordinates?
    let photos : [String]?
    let price : String?
    let hours: [YelpBusinessSearchLocationHours]?
    let transctions : [String]?
    let specialHours: [YelpBusinessSearchLocationSpecialHours]?
    
}

struct YelpBusinessSearchIdCategory : Codable {
    let alias : String?
    let title : String?
}

struct YelpBusinessSearchLocationCategory : Codable {
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


struct YelpBusinessSearchLocationCoordinates : Codable {
    let latitude: Double?
    let longitude: Double?
}

struct YelpBusinessSearchLocationHours : Codable{
    let open: [YelpBusinessSearchLocationOpen]?
    let hoursType : String?
    let isOpenNow : Bool?
}

struct YelpBusinessSearchLocationOpen: Codable {
    let isOvernight : Bool?
    let start : String?
    let end : String?
    let day : Int?
}

struct YelpBusinessSearchLocationSpecialHours : Codable{
    let date : String?
    let isClosed : Bool?
    let start : String?
    let end : String?
    let isOvernight : Bool?
}




