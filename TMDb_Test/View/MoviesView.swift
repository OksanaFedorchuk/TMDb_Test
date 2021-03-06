//
//  FavouritesView.swift
//  TMDb_Test
//
//  Created by Oksana Fedorchuk on 03.02.2021.
//

import SwiftUI



struct MoviesView: View {
    @ObservedObject var viewModel = MovieViewModel()
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        if let movies = viewModel.movies {
            ScrollView {
                LazyVGrid(columns: layout, spacing: 20) {
                    ForEach(movies) { movie in
                        let url = movie.image
                        let title = movie.title
                        NavigationLink(
                            destination: DetailsView(viewModel: viewModel, movieID: movie.movieId),
                            label: {
                                MoviePreview(url: url, title: title)
                            })
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
}

struct MoviePreview: View {
    
    var url: URL
    var title: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            AsyncImage(url: url)
                .aspectRatio(contentMode: .fit)
            
            Text(title)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(Color.black.opacity(0.30))
                .foregroundColor(.white)
                .font(.body)
        }
    }
}
