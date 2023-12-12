//
//  ListCharactersView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import SwiftUI

enum TypeViewList {
    case characters
    case locations
    case episodes
}

struct ListHomeView: View {
    
    //MARK: - ViewModel
    @EnvironmentObject var viewModel: ListHomeViewModel
    
    var type: TypeViewList
    let navigationTitle: String?
    
    var body: some View {
        NavigationView {
            List {
                HomeContentView
            }
            .navigationTitle(navigationTitle ?? Constants.noText)
        }
        .searchable(text: $viewModel.searchText, prompt: "BUSCA")
        .alert(viewModel.messageError, isPresented: $viewModel.errorValue) {
            //Salir de la app
        } message: {
            Text(Constants.messageAlertError)
                .font(.body)
        }
        .onAppear {
            viewModel.loadUI()
        }
    }
    
    //MARK: - ViewBuilder
    @ViewBuilder
    private var HomeContentView: some View {
        switch type {
            case .characters:
                ForEach(viewModel.filterCharactersbyName, id: \.id) { character in
                    //TODO: Sacar fuera if let
                    if let episodes = character.episode {
                        NavigationLink(destination: DetailCharacterView(model: character.rowDetail, type: .characters, viewModel: DetailCharacterViewModel(allEpisodeCharacter: episodes, type: .characters))) {
                            CharacterRowView(type: character.rowListMain)
                        }
                    }
                    
                }
            case .episodes:
                ForEach(viewModel.filterEpisodes, id: \.id) { episode in
                    NavigationLink(destination: DetailCharacterView(model: episode.rowDetail, type: .episodes, viewModel: DetailCharacterViewModel(allEpisodeCharacter: episode.characters!, type: .episodes))) {
                        TitleRowView(type: episode.rowListMain)
                    }
                    
                }
            case .locations:
                ForEach(viewModel.filterLocations, id: \.id) { location in
                    TitleRowView(type: location.rowListMain)
                }
        }
    }
}

#Preview {
    ListHomeView(type: .characters, navigationTitle: "Characters").environmentObject(ListHomeViewModel())
}
