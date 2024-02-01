//
//  FavouritesView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 31/1/24.
//

import SwiftUI

struct FavouritesView: View {
    @StateObject var viewModel: FavouritesViewModel
    let type: TypeViewList
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 50) {
                ButtonFilterView(title: "Locations") {
                    viewModel.filterEpisodes()
                }
                
                ButtonFilterView(title: "Characters") {
                    viewModel.filterCharacters()
                }
                
                ButtonFilterView(title: "Episodes") {
                    viewModel.filterLocation()
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 30)
            
            List {
                FavouriteContent
                    .modifier(StyleList())
            }
            .onAppear {
                viewModel.loadUI()
            }
        }
    }
    
    
    @ViewBuilder
    private var FavouriteContent: some View {
        switch viewModel.typeList {
            case .characters:
                ForEach(viewModel.characters ,id: \.id) { character in
                    CharacterFavouriteView(model: character)
                }
            case .locations:
                ForEach(viewModel.locations, id: \.id) { location in
                    EpisodeLocationFavourite(model: location)
                    
                }
            case .episodes:
                ForEach(viewModel.episodes ,id: \.id) { episode in
                    EpisodeLocationFavourite(model: episode)
                }
                
        }
    }
}

#Preview {
    FavouritesView(viewModel: FavouritesViewModel(), type: .characters)
}
