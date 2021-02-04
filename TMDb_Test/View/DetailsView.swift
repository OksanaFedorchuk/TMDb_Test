//
//  DetailsView.swift
//  TMDb_Test
//
//  Created by Oksana Fedorchuk on 03.02.2021.
//
import SwiftUI

struct DetailsView: View {
    
    @ObservedObject var viewModel: MovieViewModel

    let movieID: Int
    
    var body: some View {
        Text(viewModel.details.title)
            .onAppear {
                viewModel.getMovieDetails(movieId: movieID)
            }
    }
}






