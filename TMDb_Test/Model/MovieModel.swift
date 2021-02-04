//
//  MovieModel.swift
//  TMDb_Test
//
//  Created by Oksana Fedorchuk on 04.02.2021.
//

import Foundation

struct Movies: Codable {
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Codable, Identifiable {
    var id = UUID()
    let movieId: Int
    let title: String
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case posterPath = "poster_path"
        case title = "title"
    }
}
