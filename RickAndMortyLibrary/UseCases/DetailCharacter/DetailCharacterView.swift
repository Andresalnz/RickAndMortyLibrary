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
        Text("Character Detail")
            .font(.title)
        List {
            //MARK: - Seccion de la imagen
            Section("Image") {
                if let image = character.image {
                    AsyncImageView(urlImage: image)
                        .scaledToFill()
                        .listRowBackground(RoundedRectangle(cornerRadius: 8)
                            .background(.clear)
                            .foregroundColor(.clear)
                            .padding(.vertical)
                        )
                        .shadow(radius: 8)
                } else {
                    Image(systemName: "person.fill")
                }
                
            }
            //MARK: - Seccion de la informacion
            Section("Information") {
                InfoDetailCharacterRowView(icon: "circle.fill", label: Text("Status"), value: Text(character.status?.rawValue ?? "").foregroundColor(character.status == .alive ? .green : .black))
                InfoDetailCharacterRowView(icon: "figure.arms.open", label: Text("Specie"), value: Text(character.species?.rawValue ?? Constants.noText))
                if character.type != "" {
                    InfoDetailCharacterRowView(icon: "figure.arms.open", label: Text("Type"), value: Text(character.type ?? Constants.noText))
                }
                InfoDetailCharacterRowView(icon: "person.fill", label: Text("Gender"), value: Text(character.gender?.rawValue ?? Constants.noText))
                InfoDetailCharacterRowView(icon: "globe.asia.australia.fill", label: Text("Origin"), value: Text(character.origin?.name ?? Constants.noText))
                InfoDetailCharacterRowView(icon: "location.fill", label: Text("Location"), value: Text(character.location?.name ?? Constants.noText))
            }
            //MARK: - Seccion de los episodios
            Section("Episodes") {
                ForEach(viewModel.allEpisodes, id: \.id) { episode in
                    VStack {
                        Text(episode.name ?? Constants.noText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.white)
                        HStack {
                            Text("September 10, 2017")
                                .foregroundStyle(.white)
                            Spacer()
                            Text(episode.episode ?? "")
                                .foregroundStyle(.white)
                        }
                        .padding(.top)
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(RoundedRectangle(cornerRadius: 8)
                    .background(.clear)
                    .foregroundStyle(.gray)
                    .opacity(0.8)
                    .padding(.bottom, 5)
                )
            }
        }
        .onAppear {
            viewModel.loadUI()
        }
        .listStyle(.insetGrouped)
        .navigationBarBackButtonHidden(false)
        .navigationBarHidden(true)
    }
}

#Preview {
    DetailCharacterView(character: CharactersInfoBO(id: 1, name: "Rick Sanchez", status: .alive, species: .human, type: "Human with antens", gender: .male, origin: LocationOriginBO(name: "Earth", url: URL(string: "")), location: LocationOriginBO(name: "Earth", url: URL(string: "")), image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"), episode: [URL(string: "https://rickandmortyapi.com/api/episode/28")!], url: URL(string: ""), created: Date()), viewModel: DetailCharacterViewModel(allEpisodeCharacter: [URL(string: "https://rickandmortyapi.com/api/episode/28")!]))
}
