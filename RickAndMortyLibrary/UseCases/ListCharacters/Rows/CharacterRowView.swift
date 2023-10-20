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
                AsyncImage(url: image) { image in
                    image.resizable()
                        .frame(width: 170, height: 170)
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(systemName: "person.fill")
            }
            VStack(alignment: .leading) {
                Text(type.name ?? Constants.noText)
                    .font(.body)
                Label(type.status?.rawValue ?? Constants.noText, systemImage: "circle.fill")
                    .foregroundColor(type.status == .alive ? .green : .black)
                    .padding(.top, 10)
            }
            .padding(.horizontal, 10)
            
        }
    }
}

#Preview {
    CharacterRowView(type: CharactersInfoBO(id: 1, name: "Rick Sanchez", status: .unknown, species: .human, type: "", gender: .male, origin: LocationOriginBO(name: "Earth", url: URL(string: "")), location: LocationOriginBO(name: "Earth", url: URL(string: "")), image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), episode: [URL(string: "https://rickandmortyapi.com/api/episode/28")!], url: URL(string: ""), created: Date()))
}
