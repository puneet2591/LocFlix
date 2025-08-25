//
//  MoviewViewModel.swift
//  LocFlix
//
//  Created by Puneet Mahajan on 24/08/25.
//

import Foundation

@MainActor
final class MovieListViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service: APIService
    
    init(service: APIService) {
        self.service = service
    }
    
    func startPullToRefresh() async {
        movies = []
        await loadMovies()
    }
    
    func loadMovies() async {
        isLoading = true
        defer { isLoading = false }
        do {
            movies = try await service.fetchData()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
