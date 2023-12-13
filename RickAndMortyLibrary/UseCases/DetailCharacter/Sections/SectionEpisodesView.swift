//
//  SectionEpisodesView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 1/11/23.
//

import SwiftUI

struct SectionEpisodesView: View {
    
    @StateObject var viewModel: DetailCharacterViewModel
   
    let type: TypeViewList
    
    var body: some View {
        
        switch type {
            case .characters:
              
                ForEach(viewModel.allEpisodes, id: \.id) { episode in
                    ListWithSeparation(model: episode.rowDetail)

                }

            case .locations:
                HStack {
                    
                }
            case .episodes:
                ForEach(viewModel.allCharacters, id: \.id) { character in
                    ListWithSeparation(model: character.rowDetail)

                }
        }
    }
}

//#Preview {
//    SectionEpisodesView(viewModel: DetailCharacterViewModel(allEpisodeCharacter: [], type: .episodes), model: RowDetail(), type: .episodes)
//}
