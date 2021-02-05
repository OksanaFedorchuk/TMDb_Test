//
//  AsyncImage.swift
//  TMDb_Test
//
//  Created by Oksana Fedorchuk on 04.02.2021.
//

import Foundation
import SwiftUI
import Combine

struct AsyncImage: View {
    @StateObject private var loader: ImageReceiver
    
    init(url: URL) {
        _loader = StateObject(wrappedValue: ImageReceiver(url: url))
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}
