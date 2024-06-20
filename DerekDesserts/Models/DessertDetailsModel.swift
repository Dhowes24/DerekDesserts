//
//  DessertDetailsModel.swift
//  DereksDesserts
//
//  Created by Derek Howes on 6/19/24.
//

import Foundation


struct DessertDetailsMeals: Hashable, Codable {
    var meals: [DessertDetailsMeal]
}


struct DessertDetailsMeal: Hashable, Codable {
    var id: String
    var name: String
    var instructions: String
    var image: String?
    var ingredients: [String]
    var measurements: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        case image = "strMealThumb"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        instructions = try container.decode(String.self, forKey: .instructions)
        image = try container.decodeIfPresent(String.self, forKey: .image)
        
        var ingredients: [String] = []
        var measurements: [String] = []
        
        let dynamicContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)
        
        for index in 1...20 {
            if let ingredientKey = DynamicCodingKeys(stringValue: "strIngredient\(index)"),
               let ingredient = try dynamicContainer.decodeIfPresent(String.self, forKey: ingredientKey), !ingredient.isEmpty {
                ingredients.append(ingredient)
            }
            
            if let measureKey = DynamicCodingKeys(stringValue: "strMeasure\(index)"),
               let measurement = try dynamicContainer.decodeIfPresent(String.self, forKey: measureKey), !measurement.isEmpty {
                measurements.append(measurement)
            }
        }
        
        self.ingredients = ingredients
        self.measurements = measurements
    }
}


struct DynamicCodingKeys: CodingKey {
    var stringValue: String
    var intValue: Int?

    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }

    init?(intValue: Int) {
        return nil
    }
}
