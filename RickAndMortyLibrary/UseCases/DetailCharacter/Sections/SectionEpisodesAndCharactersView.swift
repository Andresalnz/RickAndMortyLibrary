//
//  SectionEpisodesView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 1/11/23.
//

import SwiftUI

struct SectionEpisodesAndCharactersView: View {
    
    @EnvironmentObject var viewModel: DetailViewModel
   
    let type: TypeViewList
    
    var body: some View {
        
        switch type {
            case .characters:
                ForEach(viewModel.allEpisodes, id: \.id) { episode in
                    NavigationLink(destination: DetailView(model: episode.rowDetail, type: .episodes, viewModel: DetailViewModel(allEpisodeCharacter: episode.characters!, type: .episodes))) {
                        ListWithSeparation(model: episode.rowDetail)
                    }
                }

            case .locations, .episodes:
                ForEach(viewModel.allCharacters, id: \.id) { character in
                    NavigationLink(destination: DetailView(model: character.rowDetail, type: .characters, viewModel: DetailViewModel(allEpisodeCharacter: character.episode!, type: .characters))) {
                        CharacterRowView(type: character.rowListMain)
                    }
                }
        }
        Button("+ More") {
            viewModel.loadUI()
        }
        .listRowBackground(Color.clear)
    }
}

//#Preview {
//    SectionEpisodesView(viewModel: DetailCharacterViewModel(allEpisodeCharacter: [], type: .episodes), model: RowDetail(), type: .episodes)
//}
