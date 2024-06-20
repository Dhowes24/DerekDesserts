//
//  DessertsModel.swift
//  DereksDesserts
//
//  Created by Derek Howes on 6/19/24.
//

import Foundation


struct DessertsMeals: Hashable, Codable {
    var meals: [DessertMeal]
}


struct DessertMeal: Hashable, Codable {
    var name: String
    var image: String
    var id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case image = "strMealThumb"
        case id = "idMeal"
    }
}
