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
                        HStack {
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
            await viewModel.loadMovies()
        }
    }
}


//struct MovieListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieListView()
//    }
//}
