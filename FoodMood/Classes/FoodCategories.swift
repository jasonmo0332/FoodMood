//
//  FoodCategories.swift
//  FoodMood
//
//  Created by Jason Mo on 5/28/20.
//  Copyright © 2020 Jason Mo. All rights reserved.
//

import Foundation


class FoodCategories {
    var foodCategories : [String] = []
    var foodCategoriesQueryDictionary: [String : String] = [:]
    
    init() {
        setUpFoodCategories()
        setupFoodCategoriesQuery()
    }
    
    
    func setUpFoodCategories() {
        foodCategories = ["Afghan",
        "African",
        "American",
        "Arabian",
        "Argentine",
        "Armenian",
        "Asian Fusion",
        "Australian",
        "Austrian",
        "Baguettes",
        "Bangladeshi",
        "Barbeque",
        "Belgian",
        "Brazilian",
        "Breakfast & Brunch",
        "British",
        "Bulgarian",
        "Burgers",
        "Burmese",
        "Cafes",
        "Cafeteria",
        "Cajun/Creole",
        "Caribbean",
        "Cheesesteaks",
        "Chicken Wings",
        "Chinese",
        "Comfort Food",
        "Cuban",
        "Czech",
        "Delis",
        "Diners",
        "Eritrean",
        "Fast Food",
        "Filipino",
        "Fish & chips",
        "Food Court",
        "Food Stands",
        "French",
        "German",
        "Greek",
        "Guamanian",
        "Greek",
        "Halal",
        "Hawaiian",
        "Himalayan",
        "Honduran",
        "Hong Kong Style Cafe",
        "Hot Dogs",
        "Hot Pot",
        "Hungarian",
        "Iberian",
        "Indian",
        "Indonesian",
        "Italian",
        "Japanese",
        "Kebab",
        "Korean",
        "Kosher",
        "Laotian",
        "Latin American",
        "Malaysian",
        "Mediterranean",
        "Mexican",
        "Middle Eastern",
        "Mongolian",
        "Moroccan",
        "Nicaraguan",
        "Noodles",
        "Pakistani",
        "Pan Asian",
        "Persian/Iranian",
        "Peruvian",
        "Pizza",
        "Polish",
        "Portuguese",
        "Poutineries",
        "Russian",
        "Salad",
        "Sandwiches",
        "Seafood",
        "Singaporean",
        "Soul Food",
        "Soup",
        "Sri Lankan",
        "Steakhouses",
        "Sushi Bars",
        "Syrian",
        "Taiwanese",
        "Tapas Bars",
        "Tapas/Small Plates",
        "Tex-Mex",
        "Thai",
        "Turkish",
        "Ukrainian",
        "Vietnamese",
        "Waffles",
        "Wraps"]
//        foodCategories = ["American"]
    }
    func setupFoodCategoriesQuery() {
        foodCategoriesQueryDictionary["Afghan"] = "afghani"
        foodCategoriesQueryDictionary["African"] = "african"
        foodCategoriesQueryDictionary["American"] = "newamerican"
        foodCategoriesQueryDictionary["Arabian"] = "arabian"
        foodCategoriesQueryDictionary["Argentine"] = "argentine"
        foodCategoriesQueryDictionary["Armenian"] = "armenian"
        foodCategoriesQueryDictionary["Asian Fusion"] = "asianfusion"
        foodCategoriesQueryDictionary["Australian"] = "australian"
        foodCategoriesQueryDictionary["Austrian"] = "austrian"
        foodCategoriesQueryDictionary["Baguettes"] = "baguettes"
        foodCategoriesQueryDictionary["Bangladeshi"] = "bangladeshi"
        foodCategoriesQueryDictionary["Barbeque"] = "bbq"
        foodCategoriesQueryDictionary["Belgian"] = "belgian"
        foodCategoriesQueryDictionary["Brazilian"] = "brazilian"
        foodCategoriesQueryDictionary["Breakfast & Brunch"] = "breakfast_brunch"
        foodCategoriesQueryDictionary["British"] = "british"
        foodCategoriesQueryDictionary["Bulgarian"] = "bulgarian"
        foodCategoriesQueryDictionary["Burgers"] = "burgers"
        foodCategoriesQueryDictionary["Burmese"] = "burmese"
        foodCategoriesQueryDictionary["Cafes"] = "cafes"
        foodCategoriesQueryDictionary["Cafeteria"] = "cafeteria"
        foodCategoriesQueryDictionary["Cajun/Creole"] = "cajun"
        foodCategoriesQueryDictionary["Caribbean"] = "caribbean"
        foodCategoriesQueryDictionary["Cheesesteaks"] = "cheesesteaks"
        foodCategoriesQueryDictionary["Chicken Wings"] = "chicken_wings"
        foodCategoriesQueryDictionary["Chinese"] = "chinese"
        foodCategoriesQueryDictionary["Comfort Food"] = "comfortfood"
        foodCategoriesQueryDictionary["Cuban"] = "cuban"
        foodCategoriesQueryDictionary["Czech"] = "czech"
        foodCategoriesQueryDictionary["Delis"] = "delis"
        foodCategoriesQueryDictionary["Diners"] = "diners"
        foodCategoriesQueryDictionary["Eritrean"] = "eritrean"
        foodCategoriesQueryDictionary["Fast Food"] = "hotdogs"
        foodCategoriesQueryDictionary["Filipino"] = "filipino"
        foodCategoriesQueryDictionary["Fish & chips"] = "fishnchips"
        foodCategoriesQueryDictionary["Food Court"] = "food_court"
        foodCategoriesQueryDictionary["Food Stands"] = "foodstands"
        foodCategoriesQueryDictionary["French"] = "french"
        foodCategoriesQueryDictionary["German"] = "german"
        foodCategoriesQueryDictionary["Greek"] = "greek"
        foodCategoriesQueryDictionary["Guamanian"] = "guamanian"
        foodCategoriesQueryDictionary["Greek"] = "greek"
        foodCategoriesQueryDictionary["Halal"] = "halal"
        foodCategoriesQueryDictionary["Hawaiian"] = "hawaiian"
        foodCategoriesQueryDictionary["Himalayan"] = "himalayan"
        foodCategoriesQueryDictionary["Honduran"] = "honduran"
        foodCategoriesQueryDictionary["Hong Kong Style Cafe"] = "hkcafe"
        foodCategoriesQueryDictionary["Hot Dogs"] = "hotdog"
        foodCategoriesQueryDictionary["Hot Pot"] = "hotpot"
        foodCategoriesQueryDictionary["Hungarian"] = "hungarian"
        foodCategoriesQueryDictionary["Iberian"] = "iberian"
        foodCategoriesQueryDictionary["Indian"] = "indpak"
        foodCategoriesQueryDictionary["Indonesian"] = "indonesian"
        foodCategoriesQueryDictionary["Italian"] = "italian"
        foodCategoriesQueryDictionary["Japanese"] = "japanese"
        foodCategoriesQueryDictionary["Kebab"] = "kebab"
        foodCategoriesQueryDictionary["Korean"] = "korean"
        foodCategoriesQueryDictionary["Kosher"] = "kosher"
        foodCategoriesQueryDictionary["Laotian"] = "laotian"
        foodCategoriesQueryDictionary["Latin American"] = "latin"
        foodCategoriesQueryDictionary["Malaysian"] = "malaysian"
        foodCategoriesQueryDictionary["Mediterranean"] = "mediterranean"
        foodCategoriesQueryDictionary["Mexican"] = "mexican"
        foodCategoriesQueryDictionary["Middle Eastern"] = "mideastern"
        foodCategoriesQueryDictionary["Mongolian"] = "mongolian"
        foodCategoriesQueryDictionary["Moroccan"] = "moroccan"
        foodCategoriesQueryDictionary["Nicaraguan"] = "nicaraguan"
        foodCategoriesQueryDictionary["Noodles"] = "noodles"
        foodCategoriesQueryDictionary["Pakistani"] = "pakistani"
        foodCategoriesQueryDictionary["Pan Asian"] = "panasian"
        foodCategoriesQueryDictionary["Persian/Iranian"] = "persian"
        foodCategoriesQueryDictionary["Peruvian"] = "peruvian"
        foodCategoriesQueryDictionary["Pizza"] = "pizza"
        foodCategoriesQueryDictionary["Polish"] = "polish"
        foodCategoriesQueryDictionary["Portuguese"] = "portuguese"
        foodCategoriesQueryDictionary["Poutineries"] = "poutineries"
        foodCategoriesQueryDictionary["Russian"] = "russian"
        foodCategoriesQueryDictionary["Salad"] = "salad"
        foodCategoriesQueryDictionary["Sandwiches"] = "sandwiches"
        foodCategoriesQueryDictionary["Seafood"] = "seafood"
        foodCategoriesQueryDictionary["Singaporean"] = "singaporean"
        foodCategoriesQueryDictionary["Soul Food"] = "soulfood"
        foodCategoriesQueryDictionary["Soup"] = "soup"
        foodCategoriesQueryDictionary["Sri Lankan"] = "srilankan"
        foodCategoriesQueryDictionary["SteakHouses"] = "steak"
        foodCategoriesQueryDictionary["Sushi Bars"] = "sushi"
        foodCategoriesQueryDictionary["Syrian"] = "syrian"
        foodCategoriesQueryDictionary["Taiwanese"] = "taiwanese"
        foodCategoriesQueryDictionary["Tapas Bars"] = "tapas"
        foodCategoriesQueryDictionary["Tapas/Small Plates"] = "tapasmallplates"
        foodCategoriesQueryDictionary["Tex-Mex"] = "tex-mex"
        foodCategoriesQueryDictionary["Thai"] = "thai"
        foodCategoriesQueryDictionary["Turkish"] = "turkish"
        foodCategoriesQueryDictionary["Ukrainian"] = "ukrainian"
        foodCategoriesQueryDictionary["Vietnamese"] = "vietnamese"
        foodCategoriesQueryDictionary["Waffles"] = "waffles"
        foodCategoriesQueryDictionary["Wraps"] = "wraps"
        
    }
    
    
    
    
    func refreshFoodCategories() {
        print("reached end and refreshed")
        setUpFoodCategories()
    }
}
