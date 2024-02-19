//
//  FavouritesView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 31/1/24.
//

import SwiftUI

struct FavouritesView: View {
    @StateObject var viewModel: FavouritesViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 50) {
                ButtonFilterView(title: "Locations") {
                    viewModel.typeList = .locations
                    viewModel.loadUI()
                }
                
                ButtonFilterView(title: "Characters") {
                    viewModel.typeList = .characters
                    viewModel.loadUI()
                }
                
                ButtonFilterView(title: "Episodes") {
                    viewModel.typeList = .episodes
                    viewModel.loadUI()
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
                        .modifier(SwipeActionsViewModifier(action: {viewModel.loadDelete(id: character.id)}, label:  Label("Delete", systemImage: "trash")))
                }
                .modifier(SwipeActionsViewModifier(action: {print("PUUM")}, label:  Label("Delete", systemImage: "trash")))
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
    FavouritesView(viewModel: FavouritesViewModel(typeList: .characters))
}
