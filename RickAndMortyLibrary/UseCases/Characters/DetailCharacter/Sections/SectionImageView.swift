//
//  SectionImageView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 1/11/23.
//

import SwiftUI

struct SectionImageView: View {
    
    let character: CharactersInfoBO
    
    var body: some View {
            if let image = character.image {
                AsyncImageView(urlImage: image)
                    .scaledToFill()
                    .listRowBackground(RoundedRectangle(cornerRadius: Constants.sizeCornerRadius)
                        .background(.clear)
                        .foregroundColor(.clear)
                        .padding(.vertical)
                    )
                    .shadow(radius: Constants.sizeCornerRadius)
            } else {
                Image(systemName: "person.fill")
            }
    }
}

#Preview {
    SectionImageView(character: CharactersInfoBO(id: 1, name: "Rick Sanchez", status: .alive, species: .human, type: "Human with antens", gender: .male, origin: LocationOriginBO(name: "Earth", url: URL(string: "")), location: LocationOriginBO(name: "Earth", url: URL(string: "")), image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), episode: [URL(string: "https://rickandmortyapi.com/api/episode/28")!], url: URL(string: ""), created: Date()))
}
