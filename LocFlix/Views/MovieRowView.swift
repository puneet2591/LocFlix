//
//  MovieRowView.swift
//  LocFlix
//
//  Created by Puneet Mahajan on 24/08/25.
//

import SwiftUI

struct MovieRowView: View {
    
    @State var movie: Movie
    
    var body: some View {
        FallbackAsyncImage(
            urlString: movie.poster,
            fallbackURL: MovieConstants.defaultMovieUrl,
            width: 60,
            height: 90
        )
        
        VStack(alignment: .leading, spacing: 4) {
            Text(movie.title)
                .font(.headline)
            Text("⭐️ \(movie.rating, specifier: "%.1f")")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

//struct MovieRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieRowView()
//    }
//}
