//
//  LocFlixTests.swift
//  LocFlixTests
//
//  Created by Puneet Mahajan on 25/08/25.
//

import XCTest

@testable import LocFlix

final class MovieServiceTests: XCTestCase {
    
    var service: MockAPIService!
    var session: URLSession!
    
    override func setUp() {
        super.setUp()
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        session = URLSession(configuration: config)
        service = MockAPIService(session: session)
    }
    
    override func tearDown() {
        service = nil
        session = nil
        MockURLProtocol.mockResponseData = nil
        MockURLProtocol.mockError = nil
        super.tearDown()
    }
    
    func testFetchMoviesReturnsMovies() async throws {
        // Arrange
        let mockMovies = [
            Movie(id: 1, title: "Test Movie", poster: "url", rating: 7.5, description: "Test description")
        ]
        let mockData = try JSONEncoder().encode(mockMovies)
        MockURLProtocol.mockResponseData = mockData
        
        // Act
        let movies = try await service.fetchData()
        
        // Assert
        XCTAssertEqual(movies.count, 1)
        XCTAssertEqual(movies.first?.title, "Test description")
    }
    
    func testFetchMoviesThrowsError() async {
        // Arrange
        MockURLProtocol.mockError = URLError(.badServerResponse)
        
        do {
            _ = try await service.fetchData()
            XCTFail("Expected error, but got success")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }
}

