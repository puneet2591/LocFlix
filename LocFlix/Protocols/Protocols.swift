//
//  Protocols.swift
//  LocFlix
//
//  Created by Puneet Mahajan on 24/08/25.
//

import Foundation

protocol APIService {
    var session: URLSession { get set }
    func fetchData() async throws -> [Movie]
}

