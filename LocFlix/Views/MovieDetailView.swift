//
//  MovieDetailView.swift
//  LocFlix
//
//  Created by Puneet Mahajan on 24/08/25.
//

import SwiftUI

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Poster Image
                FallbackAsyncImage(
                    urlString: movie.poster,
                    fallbackURL: MovieConstants.defaultMovieUrl,
                    width: UIScreen.main.bounds.width * 0.9,
                    height: 400
                )
                .frame(maxWidth: .infinity)
                .padding(.top)
                
                // Title
                Text(movie.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                // Rating
                HStack {
                    Text("⭐️ \(movie.rating, specifier: "%.1f")")
                        .font(.headline)
                        .foregroundColor(.yellow)
                    Spacer()
                }
                
                // Description
                Text(movie.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}


//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}
