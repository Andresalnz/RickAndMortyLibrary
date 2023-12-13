//
//  DetailCharacterViewModel.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    //MARK: - Variables
    
    private let interactor: InteractorRickAndMorty = InteractorRickAndMorty()
    
    //Propiedad que almacena las URL de los episodios del personaje elegido
    let allEpisodeCharacter: [URL]
    let type: TypeViewList
    
    //Propidedad que almacena todos los episodios
    @Published var allEpisodes: [EpisodeResultsBO] = []
    @Published var allCharacters: [CharactersResultsBO] = []
    
    //Propiedad que almacena un solo episodio
    var episode: EpisodeResultsBO?
    var character: CharactersResultsBO?
    
    //MARK: - Init
    init(allEpisodeCharacter: [URL], type: TypeViewList) {
        self.allEpisodeCharacter = allEpisodeCharacter
        self.type = type
    }
    
    //MARK: - Método para uso en la vista, para pintar todo lo necesario
    func loadUI() {
        Task {
            try await loadData()
        }
    }
    
    //MARK: - Método que se ejecuta en el hilo principal, para guardar todos los datos
    @MainActor
    func loadData() async throws {
        
        do {
            for urlEpisode in allEpisodeCharacter {
                switch type {
                    case .characters:
                        episode = try await interactor.singleEpisode(url: urlEpisode)
                        if let episode = episode {
                            allEpisodes.append(episode)
                        }
                    case .episodes, .locations:
                        character = try await interactor.singleCharacter(url: urlEpisode)
                        if let character = character {
                            allCharacters.append(character)
                        }
                }
            }
        } catch {
            throw ErrorHandler.requestEpisodeInvalid
        }
    }
}
