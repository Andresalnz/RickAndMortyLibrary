//
//  SectionEpisodesView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 1/11/23.
//

import SwiftUI

struct SectionEpisodesView: View {
    
    @StateObject var viewModel: DetailCharacterViewModel
    
    var body: some View {
            ForEach(viewModel.allEpisodes, id: \.id) { episode in
                VStack {
                    Text(episode.name ?? Constants.noText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Text(episode.airDate ?? Constants.noText)
                        Spacer()
                        Text(episode.episode ?? Constants.noText)
                    }
                }
                .padding(.bottom, 10)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(RoundedRectangle(cornerRadius: Constants.sizeCornerRadius)
                .background(.clear)
                .foregroundStyle(.white)
                .opacity(0.8)
                .padding(.bottom, 10)
            )
    }
}

#Preview {
    SectionEpisodesView(viewModel: DetailCharacterViewModel(allEpisodeCharacter: [URL(string: "https://rickandmortyapi.com/api/episode/28")!]))
}
