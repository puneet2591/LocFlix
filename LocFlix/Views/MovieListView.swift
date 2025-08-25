//
//  MovieListView.swift
//  LocFlix
//
//  Created by Puneet Mahajan on 24/08/25.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var viewModel: MovieListViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Please wait...")
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.movies, id: \.id) { movie in
                        HStack(spacing: 7) {
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                MovieRowView(movie: movie)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Movies 🎬")
        }
        .task {
            // initial load
            await viewModel.loadMovies()
        }
        .refreshable {
            // pull to refresh
            Task {
                await viewModel.startPullToRefresh()
            }
        }
    }
}


//struct MovieListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieListView()
//    }
//}
