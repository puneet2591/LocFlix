//
//  LocFlixApp.swift
//  LocFlix
//
//  Created by Puneet Mahajan on 24/08/25.
//

import SwiftUI

@main
struct LocFlixApp: App {
    var body: some Scene {
        WindowGroup {
            MovieListView(viewModel: MovieListViewModelFactory.createMovieViewModel())
        }
    }
}
