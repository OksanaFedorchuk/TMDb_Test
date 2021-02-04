//
//  APIClient.swift
//  TMDb_Test
//
//  Created by Oksana Fedorchuk on 04.02.2021.
//

import Foundation

import Foundation
import Combine

struct APIClient {
    //response object
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    //publisher call
    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
