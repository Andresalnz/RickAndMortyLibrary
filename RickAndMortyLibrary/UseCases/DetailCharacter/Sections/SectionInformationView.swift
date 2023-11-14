//
//  SectionInformationView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 1/11/23.
//

import SwiftUI

struct SectionInformationView: View {
    
    let character: CharactersInfoBO
    
    var body: some View {
            InfoDetailCharacterRowView(icon: "circle.fill", label: Text("Status"), value: Text(character.status?.rawValue ?? "").foregroundColor(character.status == .alive ? .green : .black))
            InfoDetailCharacterRowView(icon: "person.circle", label: Text("Specie"), value: Text(character.species?.rawValue ?? Constants.noText))
            if character.type != "" {
                InfoDetailCharacterRowView(icon: "person.circle", label: Text("Type"), value: Text(character.type ?? Constants.noText))
            }
            InfoDetailCharacterRowView(icon: "person.fill", label: Text("Gender"), value: Text(character.gender?.rawValue ?? Constants.noText))
            InfoDetailCharacterRowView(icon: "globe.asia.australia.fill", label: Text("Origin"), value: Text(character.origin?.name ?? Constants.noText))
            InfoDetailCharacterRowView(icon: "location.fill", label: Text("Location"), value: Text(character.location?.name ?? Constants.noText))
    }
}

#Preview {
    SectionInformationView(character: CharactersInfoBO(id: 1, name: "Rick Sanchez", status: .alive, species: .human, type: "Human with antens", gender: .male, origin: LocationOriginBO(name: "Earth", url: URL(string: "")), location: LocationOriginBO(name: "Earth", url: URL(string: "")), image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), episode: [URL(string: "https://rickandmortyapi.com/api/episode/28")!], url: URL(string: ""), created: Date()))
}
