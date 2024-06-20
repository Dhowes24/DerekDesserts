//
//  DessertDetailsViewModel.swift
//  DerekDesserts
//
//  Created by Derek Howes on 6/19/24.
//


import Foundation
import SwiftUI

@MainActor class DessertDetailsViewModel: ObservableObject {
    @Published var dessertDetails: DessertDetailsMeal?
    @Published var loadComplete: Bool = false
    private let networkManager: NetworkManagerProtocol

    
    init(dessertID: String, networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
        
        Task {
            do {
                try await self.getDessertDetails(dessertID: dessertID)

            } catch {
                print("Error while fetching dessert details: \(error)")
            }
            self.loadComplete = true
        }
    }
    
    
    func getDessertDetails(dessertID: String) async throws {
        let response = try await networkManager.request("https://themealdb.com/api/json/v1/1/lookup.php?i=\(dessertID)", resultType: DessertDetailsMeals.self)
        if response.meals.isEmpty {
            dessertDetails = nil
        } else {
            dessertDetails = response.meals.first
        }
    }
}
