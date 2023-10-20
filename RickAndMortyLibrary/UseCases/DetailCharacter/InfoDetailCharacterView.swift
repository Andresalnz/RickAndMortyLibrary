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
            //MARK: - Status
            HStack {
                Label("Status", systemImage: "circle.fill").foregroundColor(character.status == .alive ? .green : .black)
                Spacer()
                Text(character.status?.rawValue ?? Constants.noText)
            }
            .padding(.bottom)
            
            //MARK: - Specie
            HStack {
                Label("Specie", systemImage: "figure.arms.open")
                Spacer()
                Text(character.species?.rawValue ?? Constants.noText)
            }
            .padding(.bottom)
            
            //MARK: - Type
            if character.type != "" {
                HStack {
                    Label("Type", systemImage: "figure.arms.open")
                    Spacer()
                    Text(character.type ?? Constants.noText)
                }
                .padding(.bottom)
            }
            
            //MARK: - Gender
            HStack {
                Label("Gender", systemImage: "person.fill")
                Spacer()
                Text(character.gender?.rawValue ?? Constants.noText)
            }
            .padding(.bottom)
            
            //MARK: - Origin
            HStack {
                Label("Origin", systemImage: "globe.asia.australia.fill")
                Spacer()
                Text(character.origin?.name ?? Constants.noText)
            }
            .padding(.bottom)
            
            //MARK: - Location
            HStack {
                Label("Location", systemImage: "location.fill")
                Spacer()
                Text(character.location?.name ?? Constants.noText)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 15)
        .frame(width: 340)
        .background(.gray)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: Constants.sizeCornerRadius, height: Constants.sizeCornerRadius)))
    }
}

#Preview {
    InfoDetailCharacterView(character: CharactersInfoBO(id: 1, name: "Rick Sanchez", status: .alive, species: .human, type: "Yo mismo", gender: .male, origin: LocationOriginBO(name: "Earth", url: URL(string: "")), location: LocationOriginBO(name: "Earth", url: URL(string: "")), image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), episode: [URL(string: "https://rickandmortyapi.com/api/episode/28")!], url: URL(string: ""), created: Date()))
}
