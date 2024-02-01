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
        switch viewModel.ischaracter {
            case .characters:
                ForEach(viewModel.characters ,id: \.id) { info in
                    CharacterFavouriteView(model: info)
                }
            case .locations:
                ForEach(viewModel.locations, id: \.id) { info in
                    EpisodeLocationFavourite(model: info)
                    
                }
            case .episodes:
                ForEach(viewModel.episodes ,id: \.id) { info in
                    EpisodeLocationFavourite(model: info)
                }
                
        }
    }
}

#Preview {
    FavouritesView(viewModel: FavouritesViewModel(), type: .characters)
}
