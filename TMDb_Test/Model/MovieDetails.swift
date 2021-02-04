//
//  MovieDetails.swift
//  CombineTest
//
//  Created by Oksana Fedorchuk on 04.02.2021.
//

import Foundation

struct Details: Codable {
    let movieID: Int
    let image: String
    let title: String
    let voteAverage: Double
    let genres: [Genre]
    let language: [Language]
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case movieID = "id"
        case image = "backdrop_path"
        case title = "title"
        case voteAverage = "vote_average"
        case genres = "genres"
        case language = "spoken_languages"
        case overview = "overview"
    }
}

struct Genre: Codable {
    var genre: String
    
    enum CodingKeys: String, CodingKey {
        case genre = "name"
    }
}

struct Language: Codable {
    var language: String
    
    enum CodingKeys: String, CodingKey {
        case language = "name"
    }
}
