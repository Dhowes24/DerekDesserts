import XCTest
@testable import DerekDesserts

class DessertServiceTests: XCTestCase {
    
    func testFetchDessertDetailsSuccess() async throws {
        let jsonData = """
        {
            "meals": [
                {
                 "strMeal": "Apam balik",
                 "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                 "idMeal": "53049"
                },
                {
                 "strMeal": "Apple & Blackberry Crumble",
                 "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
                 "idMeal": "52893"
               }
            ]
        }
        """.data(using: .utf8)!
        
        let mockNetworkManager = MockNetworkManager(data: jsonData)
        let dessertService =  await DessertsViewModel(networkManager: mockNetworkManager)
        
        try await dessertService.getDesserts()

        let desserts = await dessertService.desserts
        XCTAssertEqual(desserts.count, 2)
        XCTAssertEqual(desserts[0].id, "53049")
        XCTAssertEqual(desserts[1].id, "52893")
    }
    
    func testFetchDessertDetailsFailure() async throws {
        let mockNetworkManager = MockNetworkManager(error: NetworkError.invalidResponse)
        
        let dessertService =  await DessertsViewModel(networkManager: mockNetworkManager)

        do {
            _ = try await dessertService.getDesserts()
            XCTFail("Expected request to throw an error")
        } catch {
            XCTAssertEqual(error as? NetworkError, NetworkError.invalidResponse)
        }
    }
}
