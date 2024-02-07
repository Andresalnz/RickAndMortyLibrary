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
        .navigationViewStyle(.stack)
        .searchable(text: $viewModel.searchText, prompt: Constants.searchPrompt)
        .alert(viewModel.errorMsg, isPresented: $viewModel.showAlert) {
          //
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
                ForEach(viewModel.searchCharacters, id: \.id) { character in
                    if let episodes = character.episode {
                        NavigationLink(destination: DetailView(model: character.rowDetail, type: .characters, viewModel: DetailViewModel(allEpisodeCharacter: episodes, type: .characters))) {
                            CharacterRowView(type: character.rowListMain)
                        }
                    }
                }
                .modifier(StyleList())
            case .episodes:
                ForEach(viewModel.searchEpisodes, id: \.id) { episode in
                    NavigationLink(destination: DetailView(model: episode.rowDetail, type: .episodes, viewModel: DetailViewModel(allEpisodeCharacter: episode.characters!, type: .episodes))) {
                        TitleRowView(type: episode.rowListMain)
                    }
                    
                }
                .modifier(StyleList())
            case .locations:
                ForEach(viewModel.searchLocations, id: \.id) { location in
                    NavigationLink(destination: DetailView(model: location.rowDetail, type: .locations, viewModel: DetailViewModel(allEpisodeCharacter: location.residents!, type: .locations))) {
                        TitleRowView(type: location.rowListMain)
                    }
                }
                .modifier(StyleList())
        }
    }
}

#Preview {
    ListHomeView(type: .characters, navigationTitle: "Characters").environmentObject(ListHomeViewModel())
}
