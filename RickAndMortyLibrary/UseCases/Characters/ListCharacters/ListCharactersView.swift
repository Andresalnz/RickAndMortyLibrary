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

struct ListCharactersView: View {
    
    //MARK: - ViewModel
    @EnvironmentObject var viewModel: ListCharactersViewModel
    
    var type: TypeViewList
    
    var body: some View {
        NavigationView {
            List {
                contentList
            }
            .navigationTitle(Constants.titleCharacters)
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
    
    @ViewBuilder
    private var contentList: some View {
        switch type {
            case .characters:
                ForEach(viewModel.filterCharactersbyName, id: \.id) { character in
                    //TODO: Sacar fuera if let
                    if let episodes = character.episode {
                        NavigationLink(destination: DetailCharacterView(model: character.detail, viewModel: DetailCharacterViewModel(allEpisodeCharacter: episodes))) {
                            CharacterRowView(type: character.rowListAndDetail)
                        }
                    }
                   
                }
            case .episodes:
                    ForEach(viewModel.episodes, id: \.id) { episode in
                        TitleRowView(type: episode.rowListAndDetail)
                    }
            case .locations:
                HStack {
                    
                }
        }
    }
}

#Preview {
    ListCharactersView(type: .characters).environmentObject(ListCharactersViewModel())
}
