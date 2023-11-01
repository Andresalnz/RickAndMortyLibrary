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
        Section("Episodes") {
            ForEach(viewModel.allEpisodes, id: \.id) { episode in
                VStack {
                    Text(episode.name ?? Constants.noText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Text(episode.airDate ?? "")
                        Spacer()
                        Text(episode.episode ?? "")
                    }
                }
                .padding(.bottom, 30)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(RoundedRectangle(cornerRadius: 8)
                .background(.clear)
                .foregroundStyle(.white)
                .opacity(0.8)
                .padding(.bottom, 30)
            )
        }
    }
}

#Preview {
    SectionEpisodesView(viewModel: DetailCharacterViewModel(allEpisodeCharacter: [URL(string: "https://rickandmortyapi.com/api/episode/28")!]))
}
