//
//  MovieDetails.swift
//  CombineTest
//
//  Created by Oksana Fedorchuk on 04.02.2021.
//

import Foundation

struct MovieDetails: Codable {
    let movieID: Int
    let backdropPath: String
    let title: String
    let voteAverage: Double
    let genres: [Genre]
    let language: [Language]
    let overview: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case movieID = "id"
        case backdropPath = "backdrop_path"
        case title = "title"
        case voteAverage = "vote_average"
        case genres = "genres"
        case language = "spoken_languages"
        case overview = "overview"
        case releaseDate = "release_date"
    }
    
    var image: URL {
        URL(string: "https://image.tmdb.org/t/p/w300/\(backdropPath)")!
    }
    
    var genreText: String {
        genres.first?.genreName ?? "n/a"
    }
    
    var voteAverageText: String {
        let voteScore = Int(voteAverage)
        guard voteScore > 0 else {
            return "n/a"
        }
        return "\(voteScore)/10"
    }
    
}

struct Genre: Codable {
    var genreName: String
    
    enum CodingKeys: String, CodingKey {
        case genreName = "name"
    }
}

struct Language: Codable {
    var language: String
    
    enum CodingKeys: String, CodingKey {
        case language = "name"
    }
}
