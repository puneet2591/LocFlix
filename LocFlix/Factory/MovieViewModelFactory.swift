//
//  MovieViewModelFactory.swift
//  LocFlix
//
//  Created by Puneet Mahajan on 24/08/25.
//

import Foundation

final class MovieListViewModelFactory {
    
    @MainActor static func createMovieViewModel() -> MovieListViewModel {
        return MovieListViewModel(service: MockAPIService(session: .shared))
    }
}
