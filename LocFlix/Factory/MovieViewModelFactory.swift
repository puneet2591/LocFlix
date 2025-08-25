//
//  MovieViewModelFactory.swift
//  LocFlix
//
//  Created by Puneet Mahajan on 24/08/25.
//

import Foundation

final class MovieListViewModelFactory {
    
    enum EnvironmentType {
        case real
        case mock
    }
    
    @MainActor static func createMovieViewModel(type: EnvironmentType) -> MovieListViewModel {
        switch type {
        case .real:
            return MovieListViewModel(service: RealAPIService(session: .shared))
        case .mock:
            return MovieListViewModel(service: MockAPIService(session: .shared))
        }
        
    }
}
