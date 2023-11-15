//
//  CharacterRowView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import SwiftUI

struct CharacterRowView: View {
    var type: CharactersInfoBO
    
    var body: some View {
        HStack {
            if let image = type.image {
                AsyncImageView(urlImage: image)
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0), style: FillStyle())
            } else {
                Image(systemName: "person.fill")
            }
            VStack(alignment: .leading) {
                Text(type.name ?? Constants.noText)
                    .font(.title3)
                Text(type.species?.rawValue ?? Constants.noText)
            }
            
        }
    }
}

#Preview {
    CharacterRowView(type: CharactersInfoBO(id: 1, name: "Rick Sanchez", status: .unknown, species: .human, type: "", gender: .male, origin: LocationOriginBO(name: "Earth", url: URL(string: "")), location: LocationOriginBO(name: "Earth", url: URL(string: "")), image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), episode: [URL(string: "https://rickandmortyapi.com/api/episode/28")!], url: URL(string: ""), created: Date()))
}
