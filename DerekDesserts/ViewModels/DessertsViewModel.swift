//
//  DessertsViewModel.swift
//  DereksDesserts
//
//  Created by Derek Howes on 6/19/24.
//

import Foundation
import SwiftUI

@MainActor class DessertsViewModel: ObservableObject {
    @Published var desserts: [DessertMeal] = []
    @Published var loadComplete: Bool = false
    @Published var path = NavigationPath()
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
        Task {
            do {
                try await self.getDesserts()
            } catch {
                print("Error while fetching desserts: \(error)")
            }
            self.loadComplete = true
        }
    }
    
    
    func getDesserts() async throws{
        let response = try await networkManager.request("https://themealdb.com/api/json/v1/1/filter.php?c=Dessert", resultType: DessertsMeals.self)
        self.desserts = response.meals
    }
}
