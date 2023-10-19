//
//  DetailCharacterView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import SwiftUI

struct DetailCharacterView: View {
    
    let character: CharactersInfoBO
    
    var body: some View {
        ScrollView {
            VStack {
                Text(character.name ?? "N/A")
                    .bold()
                    .font(.title)
                    .frame(maxWidth: 350, alignment: .leading)
                  
                if let image = character.image {
                    AsyncImage(url: image) { image in
                        image.resizable()
                            .frame(width: 340, height: 380)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                            .shadow(radius: 8)
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Image(systemName: "person.fill")
                }
                Text("INFO")
                    .bold()
                    .font(.title)
                    .frame(maxWidth: 350, alignment: .leading)
                InfoDetailCharacterView(character: character)
                
                Text("Episodes")
                    .bold()
                    .font(.title)
                    .frame(maxWidth: 350, alignment: .leading)
            }
        }
    }
}

#Preview {
    DetailCharacterView(character: CharactersInfoBO(id: 1, name: "Rick Sanchez", status: .alive, species: .human, type: "Yo mismo", gender: .male, origin: LocationOriginBO(name: "Earth", url: URL(string: "")), location: LocationOriginBO(name: "Earth", url: URL(string: "")), image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), episode: [""], url: URL(string: ""), created: Date()))
}
