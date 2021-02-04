//
//  DetailsView.swift
//  TMDb_Test
//
//  Created by Oksana Fedorchuk on 03.02.2021.
//

import SwiftUI



struct DetailsView: View {
//    @State var details: Details
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Hello")

//                print(printUrl())
            }
        }
    }
    
    struct DetailsView_Preview: PreviewProvider {
        static var previews: some View {
            Group {
                DetailsView()
            }
        }
    }
    



    
    func loadData() {
        
        var components = URLComponents()
        var id = 297761
        let queryItemAPI = URLQueryItem(name: "api_key", value: "b5977e527a6e071133ebf0f33054db08")
        let queryItemLanguage = URLQueryItem(name: "language", value: "en-US")
        components.scheme = "https"
        components.host = "api.themoviedb.org/3/movie/\(id)"
        
        components.queryItems = [queryItemAPI, queryItemLanguage]
        components.url

        
    }
//
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let decodedResponse = try? JSONDecoder().decode(Details.self, from: data) {
//                    DispatchQueue.main.async {
//                        self.details = decodedResponse
//                    }
//                    return
//                }
//            }
//            print("Failed fetching: \(error?.localizedDescription ?? "Unknown error")")
//        }.resume()
//
//    }
    
}



