//
//  LocFlixApp.swift
//  LocFlix
//
//  Created by Puneet Mahajan on 24/08/25.
//

import SwiftUI

@main
struct LocFlixApp: App {
    
    @StateObject private var viewModel: MovieListViewModel
    
    init() {
        if CommandLine.arguments.contains("UI_TEST_SUCCESS") {
            let mock = MockAPIService(session: .shared)
            mock.shouldThrowError = false
            mock.dataToReturn = "UI Test Success Data"
            _viewModel = StateObject(wrappedValue: MovieListViewModel(service: mock))
        } else if CommandLine.arguments.contains("UI_TEST_FAILURE") {
            let mock = MockAPIService(session: .shared)
            mock.shouldThrowError = true
            _viewModel = StateObject(wrappedValue: MovieListViewModel(service: mock))
        } else {
            _viewModel = StateObject(wrappedValue: MovieListViewModelFactory.createMovieViewModel(type: .mock))
        }
    }
    
    var body: some Scene {
        WindowGroup {
            MovieListView(viewModel: viewModel)
        }
    }
}
