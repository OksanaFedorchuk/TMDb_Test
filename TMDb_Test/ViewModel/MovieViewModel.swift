//
//  MovieViewModel.swift
//  TMDb_Test
//
//  Created by Oksana Fedorchuk on 04.02.2021.
//

import Foundation

import Combine

class MovieViewModel: ObservableObject {
    
    //keep track on changes in movies
    @Published var movies: [Movie] = []
    @Published var details = MovieDetails(movieID: 0, image: "", title: "", voteAverage: 0.0, genres: [], language: [], overview: "")
    //A type-erasing cancellable object that executes a provided closure when canceled.
    var cancellationToken: AnyCancellable?
    //fetching data when view is being created
    init() {
        getMovies()
    }
    
}

extension MovieViewModel {
    
    // Subscriber implementation
    func getMovies() {
        //making request
        cancellationToken = MovieDB.requestMovies(.popularMovies)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            //accepting the received value
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    //assign data to the movies property
                    self.movies = $0.movies
            })
    }
    
    
    func getMovieDetails(movieId: Int) {
        cancellationToken = MovieDB.requestMovieDetails(.movieDetails(movieId: movieId))
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            //accepting the received value
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    //assign data to the movies property
                    self.details = $0
            })
    }
    
}
