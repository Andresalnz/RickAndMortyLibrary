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
        .searchable(text: $viewModel.searchText)
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
                ForEach(viewModel.characters, id: \.id) { character in
                    //TODO: Sacar fuera if let
                    if let episodes = character.episode {
                        NavigationLink(destination: DetailCharacterView(model: character.rowDetail, viewModel: DetailCharacterViewModel(allEpisodeCharacter: episodes))) {
                            CharacterRowView(type: character.rowListMain)
                        }
                    }
                    
                }
            case .episodes:
                ForEach(viewModel.episodes, id: \.id) { episode in
                    TitleRowView(type: episode.rowListMain)
                }
            case .locations:
                ForEach(viewModel.locations, id: \.id) { location in
                    TitleRowView(type: location.rowListMain)
                }
        }
    }
}

#Preview {
    ListHomeView(type: .characters, navigationTitle: "Characters").environmentObject(ListHomeViewModel())
}
