//
//  FallbackAsyncImage.swift
//  LocFlix
//
//  Created by Puneet Mahajan on 24/08/25.
//

import SwiftUI

struct FallbackAsyncImage: View {
    let urlString: String?
    let fallbackURL: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        if let urlString = urlString, let url = URL(string: urlString) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: width, height: height)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                        .shadow(radius: 4)
                        .clipped()
                        .cornerRadius(8)
                case .failure(_):
                    fallbackImage
                @unknown default:
                    fallbackImage
                }
            }
        } else {
            fallbackImage
        }
    }
    
    private var fallbackImage: some View {
        AsyncImage(url: URL(string: fallbackURL)) { image in
            image.resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
                .cornerRadius(8)
        } placeholder: {
            Color.gray.opacity(0.3)
                .frame(width: width, height: height)
        }
    }
}

struct FallbackAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        FallbackAsyncImage(urlString: MovieConstants.defaultMovieUrl, fallbackURL: MovieConstants.defaultMovieUrl, width: 300, height: 500)
    }
}
