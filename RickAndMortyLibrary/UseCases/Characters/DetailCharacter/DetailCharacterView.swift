//
//  DetailCharacterView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import SwiftUI

struct DetailCharacterView: View {
    
    let character: CharactersInfoBO
    
    @StateObject var viewModel: DetailCharacterViewModel
    
    var body: some View {
        List {
            //MARK: - Seccion de la imagen
            SectionDetailView(content: SectionImageView(character: character), titleSection: "Image")
            //MARK: - Seccion de la informacion
            SectionDetailView(content: SectionInformationView(character: character), titleSection: "Information")
            //MARK: - Seccion de los episodios
            SectionDetailView(content: SectionEpisodesView(viewModel: viewModel), titleSection: "Episodes")
        }
        .navigationTitle(character.name ?? Constants.noText)
        .onAppear {
            viewModel.loadUI()
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    DetailCharacterView(character: CharactersInfoBO(id: 1, name: "Rick Sanchez", status: .alive, species: .human, type: "Human with antens", gender: .male, origin: LocationOriginBO(name: "Earth", url: URL(string: "")), location: LocationOriginBO(name: "Earth", url: URL(string: "")), image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), episode: [URL(string: "https://rickandmortyapi.com/api/episode/28")!], url: URL(string: ""), created: Date()), viewModel: DetailCharacterViewModel(allEpisodeCharacter: [URL(string: "https://rickandmortyapi.com/api/episode/28")!]))
}
