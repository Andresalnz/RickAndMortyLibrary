//
//  SectionInformationView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 1/11/23.
//

import SwiftUI

struct SectionInformationView<T>: View where T: DetailView {
    
    let model: T
    
    var body: some View {
            InfoDetailCharacterRowView(icon: "circle.fill", label: Text("Status"), value: Text(model.status?.rawValue ?? "").foregroundColor(model.status == .alive ? .green : .black))
            InfoDetailCharacterRowView(icon: "person.circle", label: Text("Specie"), value: Text(model.species?.rawValue ?? Constants.noText))
//            if model.type != "" {
//                InfoDetailCharacterRowView(icon: "person.circle", label: Text("Type"), value: Text(model.type ?? Constants.noText))
//            }
            InfoDetailCharacterRowView(icon: "person.fill", label: Text("Gender"), value: Text(model.gender?.rawValue ?? Constants.noText))
            InfoDetailCharacterRowView(icon: "globe.asia.australia.fill", label: Text("Origin"), value: Text(model.origin?.name ?? Constants.noText))
            InfoDetailCharacterRowView(icon: "location.fill", label: Text("Location"), value: Text(model.location?.name ?? Constants.noText))
    }
}

//#Preview {
//    SectionInformationView(character: CharactersInfoBO(id: 1, name: "Rick Sanchez", status: .alive, species: .human, type: "Human with antens", gender: .male, origin: LocationOriginBO(name: "Earth", url: URL(string: "")), location: LocationOriginBO(name: "Earth", url: URL(string: "")), image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), episode: [URL(string: "https://rickandmortyapi.com/api/episode/28")!], url: URL(string: ""), created: Date()))
//}
