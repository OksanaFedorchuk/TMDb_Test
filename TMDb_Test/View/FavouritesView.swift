//
//  FavouritesView.swift
//  TMDb_Test
//
//  Created by Oksana Fedorchuk on 03.02.2021.
//

import SwiftUI



struct FavouritesView: View {
    @State var results = [Movie]()
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(results) { result in
//                    NavigationLink(
//                        destination: DetailsView(details: result.id),
//                        label: {
//                            /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
//                        })
                    ZStack(alignment: .bottom) {
                        RemoteImage(url: String("https://image.tmdb.org/t/p/w300/\(result.poster_path)"))
                        Text(result.title)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(Color.oceanColor)
                            .font(.body)
                    }
                }
            }
            .padding(.horizontal)
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=b5977e527a6e071133ebf0f33054db08&language=en-US&page=1") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Movies.self, from: data) {
                    DispatchQueue.main.async {
                        self.results = decodedResponse.results
                    }
                    return
                }
            }
            print("Failed fetching: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
        
    }
}
