//
//  DetailCharacterView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import SwiftUI

struct DetailView<T>: View  where T: Detail {
    
    let model: T
    let type: TypeViewList
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        List {
          DetailContentView
        }
        .navigationTitle(model.name ?? Constants.noText)
        .toolbar(content: {
            Button("Favorito") {
                viewModel.loadSave(infoFavourite: model)
            }
        })
        .alert(viewModel.errorMsg, isPresented: $viewModel.showAlert) {
          //
        } message: {
            Text(Constants.messageAlertError)
                .font(.body)
        }
        .onAppear {
            viewModel.loadUI()
        }
        .onDisappear {
            viewModel.remove()
        }
        .listStyle(.insetGrouped)
    }
    
    //MARK: - ViewBuilder
    @ViewBuilder
    private var DetailContentView: some View {
        switch type {
            case .characters:
               Section  { SectionImageView(model: model) }
                header: { Text(Constants.titleImage) }
                    footer: {
                        Text(model.name ?? Constants.noText)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                Section(Constants.titleInformation) { SectionInformationView(model: model, type: .characters) }
                Section (Constants.titleEpisodes) { SectionEpisodesAndCharactersView(type: .characters).environmentObject(viewModel) }
        
            case .episodes:
                Section(Constants.titleInformation) { SectionInformationView(model: model, type: .episodes) }
                Section(Constants.titleCharacters) {
                    SectionEpisodesAndCharactersView(type: .episodes).environmentObject(viewModel)
                }
                
            case .locations:
                Section(Constants.titleInformation) { SectionInformationView(model: model, type: .locations) }
                Section(Constants.titleResidents) { SectionEpisodesAndCharactersView(type: .locations).environmentObject(viewModel) }
        }
    }
}

#Preview {
    DetailView(model: RowDetail(image: URL(string: "https://rickandmortyapi.com/api/character")), type: .episodes, viewModel: DetailViewModel(allEpisodeCharacter: [URL(string: "https://rickandmortyapi.com/api/character/8")!, URL(string: "https://rickandmortyapi.com/api/episode/2")!, URL(string: "https://rickandmortyapi.com/api/character/8")!], type: .episodes))
}
