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
        .onAppear {
            viewModel.loadUI()
        }
        .listStyle(.insetGrouped)
    }
    
    //MARK: - ViewBuilder
    @ViewBuilder
    private var DetailContentView: some View {
        switch type {
            case .characters:
                //MARK: - Seccion de la imagen
                SectionDetailView(content: {
                    SectionImageView(model: model)
                }, titleSection: Constants.titleImage)
                //MARK: - Seccion de la informacion
                SectionDetailView(content: {
                    SectionInformationView(model: model, type: .characters)
                }, titleSection: Constants.titleInformation)
                //MARK: - Seccion de los episodios
                SectionDetailView(content: {
                    SectionEpisodesAndCharactersView(type: .characters)
                },titleSection: Constants.titleEpisodes)
                .environmentObject(viewModel)
            case .episodes:
                SectionDetailView(content: {
                    SectionInformationView(model: model, type: .episodes)
                }, titleSection: Constants.titleInformation)
                SectionDetailView(content: {
                    SectionEpisodesAndCharactersView(type: .episodes)
                },titleSection: Constants.titleCharacters)
                .environmentObject(viewModel)
            case .locations:
                SectionDetailView(content: {
                    SectionInformationView(model: model, type: .locations)
                }, titleSection: Constants.titleInformation)
                SectionDetailView(content: {
                    SectionEpisodesAndCharactersView(type: .episodes)
                },titleSection: Constants.titleResidents)
                .environmentObject(viewModel)
        }
    }
}

//#Preview {
//    DetailCharacterView(model: RowDetail(status: .alive, gender: .Genderless, origin: LocationOriginBO(name: "Earth", url: URL(string: "")), location: LocationOriginBO(name: "Earth", url: URL(string: "")), episodes: [], image: URL(string: ""), name: "Rick", species: .Animal), viewModel: DetailCharacterViewModel(allEpisodeCharacter: []))
//}
