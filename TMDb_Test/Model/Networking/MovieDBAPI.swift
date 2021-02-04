//
//  MovieDBAPI.swift
//  CombineTest
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

enum APIPath: String {
    case popularMovies = "movie/popular"
//    case movieDetails = 
}

//https://api.themoviedb.org/3/movie/popular?api_key=b5977e527a6e071133ebf0f33054db08&language=en-US&page=1

extension MovieDB {
    
    static func request(_ path: APIPath) -> AnyPublisher<MovieResponse, Error> {
        
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        components.queryItems = [URLQueryItem(name: "api_key", value: "b5977e527a6e071133ebf0f33054db08")]
        
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
//        var components = URLComponents()
//        var id = 297761
//        let queryItemAPI = URLQueryItem(name: "api_key", value: "b5977e527a6e071133ebf0f33054db08")
//        let queryItemLanguage = URLQueryItem(name: "language", value: "en-US")
//        components.scheme = "https"
//        components.host = "api.themoviedb.org/3/movie/\(id)"
//
//        components.queryItems = [queryItemAPI, queryItemLanguage]
//        components.url
        
