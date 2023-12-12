//
//  DetailCharacterView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import SwiftUI

struct DetailCharacterView<T>: View  where T: Detail {
    
    let model: T
    let type: TypeViewList
    @StateObject var viewModel: DetailCharacterViewModel
    
    var body: some View {
        List {
          DetailContentView
//            //MARK: - Seccion de la imagen
//            SectionDetailView(content: SectionImageView(model: model), titleSection: "Image")
//            //MARK: - Seccion de la informacion
//            SectionDetailView(content: SectionInformationView(model: model), titleSection: "Information")
//            //MARK: - Seccion de los episodios
//            SectionDetailView(content: SectionEpisodesView(viewModel: viewModel), titleSection: "Episodes")
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
                }, titleSection: "Image")
                //MARK: - Seccion de la informacion
                SectionDetailView(content: {
                    SectionInformationView(model: model, type: .characters)
                }, titleSection: "Information")
                //MARK: - Seccion de los episodios
                SectionDetailView(content: {
                    SectionEpisodesView(viewModel: viewModel, model: model, type: .characters)
                },titleSection: "Episodes")
              
            case .episodes:
                SectionDetailView(content: {
                    SectionInformationView(model: model, type: .episodes)
                }, titleSection: "Information")
                SectionDetailView(content: {
                    SectionEpisodesView(viewModel: viewModel, model: model, type: .episodes)
                },titleSection: "Episodes")
            case .locations:
                SectionDetailView(content: {
                    SectionInformationView(model: model, type: .locations)
                }, titleSection: "Information")
        }
    }
}

//#Preview {
//    DetailCharacterView(model: RowDetail(status: .alive, gender: .Genderless, origin: LocationOriginBO(name: "Earth", url: URL(string: "")), location: LocationOriginBO(name: "Earth", url: URL(string: "")), episodes: [], image: URL(string: ""), name: "Rick", species: .Animal), viewModel: DetailCharacterViewModel(allEpisodeCharacter: []))
//}
