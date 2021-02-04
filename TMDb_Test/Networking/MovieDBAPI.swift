//
//  MovieDBAPI.swift
//  TMDb_Test
//
//  Created by Oksana Fedorchuk on 04.02.2021.
//

import Foundation

import Foundation
import Combine

enum MovieDB {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://api.themoviedb.org/3/")!
    
}

enum APIPath {
    case popularMovies
    case movieDetails(movieId: Int)
    
    func path() -> String {
        switch self {
        case .popularMovies:
            return "movie/popular"
        case .movieDetails(let movieId):
            return "movie/\(movieId)"
        }
    }
}

extension MovieDB {
    
    static func requestMovies(_ path: APIPath) -> AnyPublisher<Movies, Error> {
        
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path.path()), resolvingAgainstBaseURL: true)
        else { fatalError("Couldn't create URLComponents") }
        components.queryItems = [URLQueryItem(name: "api_key", value: "b5977e527a6e071133ebf0f33054db08")]
        
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func requestMovieDetails(_ path: APIPath) -> AnyPublisher<MovieDetails, Error> {
        
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path.path()), resolvingAgainstBaseURL: true)
        else { fatalError("Couldn't create URLComponents") }
        components.queryItems = [URLQueryItem(name: "api_key", value: "b5977e527a6e071133ebf0f33054db08")]
        
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}

