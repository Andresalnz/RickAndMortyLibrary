//
//  InfoDetailCharacterView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/10/23.
//

import SwiftUI

struct InfoDetailCharacterView: View {
    
    let character: CharactersInfoBO
    
    var body: some View {
        VStack {
            HStack {
                Label("Estatus", systemImage: "circle.fill").foregroundColor(character.status == .alive ? .green : .black)
                Spacer()
                Text(character.status?.rawValue ?? "N/A")
            }
            .padding(.bottom)
            HStack {
                Label("Especie", systemImage: "figure.arms.open")
                Spacer()
                Text(character.species?.rawValue ?? "N/A")
            }
            .padding(.bottom)
            if character.type != "" {
                HStack {
                    Label("Type", systemImage: "figure.arms.open")
                    Spacer()
                    Text(character.type ?? "N/A")
                }
                .padding(.bottom)
            }
          
            HStack {
                Label("Genero", systemImage: "person.fill")
                Spacer()
                Text(character.gender?.rawValue ?? "N/A")
            }
            .padding(.bottom)
            HStack {
                Label("Origen", systemImage: "globe.asia.australia.fill")
                Spacer()
                Text(character.origin?.name ?? "N/A")
            }
            .padding(.bottom)
            HStack {
                Label("Localización", systemImage: "location.fill")
                Spacer()
                Text(character.location?.name ?? "N/A")
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 15)
        .frame(width: 340)
        .background(.gray)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
    }
}

#Preview {
    InfoDetailCharacterView(character: CharactersInfoBO(id: 1, name: "Rick Sanchez", status: .alive, species: .human, type: "Yo mismo", gender: .male, origin: LocationOriginBO(name: "Earth", url: URL(string: "")), location: LocationOriginBO(name: "Earth", url: URL(string: "")), image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), episode: [URL(string: "https://rickandmortyapi.com/api/episode/28")!], url: URL(string: ""), created: Date()))
}
