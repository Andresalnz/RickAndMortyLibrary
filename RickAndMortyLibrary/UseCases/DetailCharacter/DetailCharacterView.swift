//
//  DetailCharacterView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import SwiftUI

struct DetailCharacterView: View {
    
    let character: CharactersInfoBO
    
    @StateObject var viewModel: DetailCharacterViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Text(character.name ?? Constants.noText)
                    .bold()
                    .font(.title)
                    .frame(maxWidth: Constants.maxWidthTitlesDetail, alignment: .leading)
                  
                if let image = character.image {
                    AsyncImage(url: image) { image in
                        image.resizable()
                            .frame(width: 340, height: 380)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: Constants.sizeCornerRadius, height: Constants.sizeCornerRadius)))
                            .shadow(radius: 8)
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Image(systemName: "person.fill")
                }
                Text("INFO")
                    .bold()
                    .font(.title)
                    .frame(maxWidth: Constants.maxWidthTitlesDetail, alignment: .leading)
                InfoDetailCharacterView(character: character)
                
                Text("Episodes")
                    .bold()
                    .font(.title)
                    .frame(maxWidth: Constants.maxWidthTitlesDetail, alignment: .leading)
        
                    ForEach(viewModel.allEpisodes, id: \.id) { episode in
                        Text(episode.name ?? Constants.noText)
                            .foregroundStyle(.red)
                            .font(.body)
                            .padding(.top)
                            .frame(maxWidth: Constants.maxWidthTitlesDetail, alignment: .leading)
                    }
            }
            .onAppear {
                viewModel.loadUI()
            }
        }
    }
}

#Preview {
    DetailCharacterView(character: CharactersInfoBO(id: 1, name: "Rick Sanchez", status: .alive, species: .human, type: "Human with antens", gender: .male, origin: LocationOriginBO(name: "Earth", url: URL(string: "")), location: LocationOriginBO(name: "Earth", url: URL(string: "")), image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), episode: [URL(string: "https://rickandmortyapi.com/api/episode/28")!], url: URL(string: ""), created: Date()), viewModel: DetailCharacterViewModel(allEpisodeCharacter: [URL(string: "https://rickandmortyapi.com/api/episode/28")!]))
}
