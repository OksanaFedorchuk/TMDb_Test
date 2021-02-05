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
        
        List{
            if let details = viewModel.details {
                
                AsyncImage(url: details.image)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                let movieInfo = [details.voteAverageText, details.genreText, details.releaseDate]
                HStack(alignment: .center, spacing: 20){
                    ForEach(movieInfo, id: \.self) { item in
                        Text(item)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                    }
                }
                Text(details.title)
                    .font(.title2)
                Text(details.overview)
                    .font(.body)
            }
        }.onAppear {
            viewModel.getMovieDetails(movieId: movieID)
            print("DetailView appeared!")
        } .onDisappear {
            viewModel.details = nil
            print("DetailView disappeared!")
        }
    }
}

