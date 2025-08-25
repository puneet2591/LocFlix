//
//  MovieListViewModelTests.swift
//  LocFlixTests
//
//  Created by Puneet Mahajan on 25/08/25.
//

import XCTest
@testable import LocFlix

@MainActor
final class MovieListViewModelTests: XCTestCase {
    
    func testLoadMoviesSuccess() async {
        // Arrange
        let mockMovies = [
            Movie(id: 1, title: "Mock Title", poster: "mock", rating: 8.0, description: "Mock description")
        ]
        let mockService = MockMovieService(movies: mockMovies)
        let viewModel = MovieListViewModel(service: mockService)
        
        // Act
        await viewModel.loadMovies()
        
        // Assert
        XCTAssertEqual(viewModel.movies.count, 1)
        XCTAssertEqual(viewModel.movies.first?.title, "Mock Title")
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testLoadMoviesFailure() async {
        // Arrange
        let mockService = MockMovieService(error: URLError(.badServerResponse))
        let viewModel = MovieListViewModel(service: mockService)
        
        // Act
        await viewModel.loadMovies()
        
        // Assert
        XCTAssertTrue(viewModel.movies.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
    }
}

// MARK: - Mock Service
class MockMovieService: MockAPIService {
    private let mockMovies: [Movie]?
    private let mockError: Error?
    
    init(movies: [Movie]? = nil, error: Error? = nil) {
        self.mockMovies = movies
        self.mockError = error
        super.init(session: .shared)
    }
    
    override func fetchData() async throws -> [Movie] {
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        if let error = mockError {
            throw error
        }
        return mockMovies ?? []
    }
}

