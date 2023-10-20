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
                    NavigationLink(destination: DetailCharacterView(character: character)) {
                        CharacterRowView(type: character)
                    }
                }
                .listStyle(.grouped)
                .navigationTitle("Characters")
                
            }
            
            .onAppear {
                  viewModel.loadUI()
            }
        }
    }
}

#Preview {
    ListCharactersView().environmentObject(ListCharactersViewModel())
}
