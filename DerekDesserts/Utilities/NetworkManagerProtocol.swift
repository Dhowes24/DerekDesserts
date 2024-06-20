//
//  NetworkManagerProtocol.swift
//  DerekDesserts
//
//  Created by Derek Howes on 6/19/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func request<T: Codable>(_ endpoint: String, resultType: T.Type) async throws -> T
}
