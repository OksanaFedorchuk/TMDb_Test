//
//  Movie.swift
//  TMDb_Test
//
//  Created by Oksana Fedorchuk on 04.02.2021.
//

import Foundation

struct Movies: Codable {
    var results: [Movie]
}

struct Movie: Codable, Identifiable {
    var id: Int
    var poster_path: String
    var title: String
}

struct Details: Codable {
    var id: Int
    var backdrop_path: String
    var title: String
    var vote_average: Double
    var genres: [Genre]
    var spoken_languages: [Language]
    var overview: String
}

struct Genre: Codable {
    var name: String
}

struct Language: Codable {
    var name: String
}
