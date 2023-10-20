//
//  ListCharactersView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import SwiftUI

struct ListCharactersView: View {
    
    //MARK: - ViewModel
    @EnvironmentObject var viewModel: ListCharactersViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.characters, id: \.id) { character in
                    if let episode = character.episode {
                        NavigationLink(destination: DetailCharacterView(character: character, viewModel: DetailCharacterViewModel(allEpisodeCharacter: episode))) {
                            CharacterRowView(type: character)
                        }
                    }
                }
                .listStyle(.grouped)
                .navigationTitle(Constants.titleCharacters)
            }
            .onAppear {
                  viewModel.loadUI()
            }
            .alert(viewModel.messageError, isPresented: $viewModel.errorValue) {
                //
            } message: {
                Text(Constants.messageAlertError)
                    .font(.body)
            }

        }
    }
}

#Preview {
    ListCharactersView().environmentObject(ListCharactersViewModel())
}
