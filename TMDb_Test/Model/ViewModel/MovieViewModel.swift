//
//  MovieViewModel.swift
//  CombineTest
//
//  Created by Oksana Fedorchuk on 04.02.2021.
//

import Foundation

import Combine

class MovieViewModel: ObservableObject {
    
    //keep track on changes in movies
    @Published var movies: [Movie] = []
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
        cancellationToken = MovieDB.request(.popularMovies)
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
    
}
