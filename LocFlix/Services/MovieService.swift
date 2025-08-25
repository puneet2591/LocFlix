//
//  MovieService.swift
//  LocFlix
//
//  Created by Puneet Mahajan on 24/08/25.
//

import Foundation

class MockAPIService: APIService {
    
    var shouldThrowError = false
    var dataToReturn = "Mocked Data"
    
    var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    private let baseURL = "http://localhost:3000"
    
    func fetchData() async throws -> [Movie] {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        guard let url = URL(string: "\(baseURL)/movies") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await session.data(from: url)
        return try JSONDecoder().decode([Movie].self, from: data)
    }
    
}

class RealAPIService: APIService {

    var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    private let baseURL = "http://localhost:3000"

    func fetchData() async throws -> [Movie] {
        guard let url = URL(string: "\(baseURL)/movies") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Movie].self, from: data)
    }

}

