//
//  AsyncImageView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 23/10/23.
//

import SwiftUI

struct AsyncImageView: View {
    
    let urlImage: URL
    
    var body: some View {
        AsyncImage(url: urlImage) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    AsyncImageView(urlImage: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!)
}
