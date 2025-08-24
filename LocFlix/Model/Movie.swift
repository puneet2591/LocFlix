//
//  Movie.swift
//  LocFlix
//
//  Created by Puneet Mahajan on 24/08/25.
//

import Foundation

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let poster: String
    let rating: Double
    let description: String
}
