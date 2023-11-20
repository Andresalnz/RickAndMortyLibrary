//
//  DetailCharacterView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import SwiftUI

protocol DetailView {
    var image: URL? { get }
    var name: String? { get }
    var species: Species? { get }
    var status: Status? { get }
    var gender: Gender? { get }
    var origin: LocationOriginBO? { get }
    var location: LocationOriginBO? { get }
    var episodes: [URL]? { get }
}

struct DetailCharacterView<T>: View  where T: DetailView {
    
    let model: T
    
    @StateObject var viewModel: DetailCharacterViewModel
    
    var body: some View {
        List {
          
            //MARK: - Seccion de la imagen
            SectionDetailView(content: SectionImageView(model: model), titleSection: "Image")
            //MARK: - Seccion de la informacion
            SectionDetailView(content: SectionInformationView(model: model), titleSection: "Information")
            //MARK: - Seccion de los episodios
            SectionDetailView(content: SectionEpisodesView(viewModel: viewModel), titleSection: "Episodes")
        }
        .navigationTitle(model.name ?? Constants.noText)
        .onAppear {
            viewModel.loadUI()
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    DetailCharacterView(model: RowDetail(status: .alive, gender: .Genderless, origin: LocationOriginBO(name: "Earth", url: URL(string: "")), location: LocationOriginBO(name: "Earth", url: URL(string: "")), episodes: [], image: URL(string: ""), name: "Rick", species: .Animal), viewModel: DetailCharacterViewModel(allEpisodeCharacter: []))
}
