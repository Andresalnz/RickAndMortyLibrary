//
//  DetailCharacterViewModel.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    //MARK: - Variables
    
    private let interactor: Interactor
    
    //Propiedad que almacena las URL de los episodios del personaje elegido
    let allEpisodeCharacter: [URL]
    let type: TypeViewList
    
    //Propidedad que almacena todos los episodios
    @Published var allEpisodes: [EpisodeResultsBO]
    @Published var allCharacters: [CharactersResultsBO]
    
    //Propiedad que almacena un solo episodio
    var episode: EpisodeResultsBO?
    var character: CharactersResultsBO?
    
    //MARK: - Init
    init(interactor: Interactor = Interactor.shared, allEpisodeCharacter: [URL], type: TypeViewList, allEpisodes: [EpisodeResultsBO] = [], allCharacters: [CharactersResultsBO] = [], episode: EpisodeResultsBO? = nil, character: CharactersResultsBO? = nil) {
        self.interactor = interactor
        self.allEpisodeCharacter = allEpisodeCharacter
        self.type = type
        self.allEpisodes = allEpisodes
        self.allCharacters = allCharacters
        self.episode = episode
        self.character = character
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
            for urlEpisodeOrCharacter in allEpisodeCharacter {
                let singleEpisode = try await interactor.singleEpisode(url: urlEpisodeOrCharacter)
                let singleCharacter = try await interactor.singleCharacter(url: urlEpisodeOrCharacter)
                switch type {
                    case .characters:
                        self.episode = singleEpisode.toBo()
                        if let episode = episode {
                            allEpisodes.append(episode)
                        }
                    case .episodes, .locations:
                        self.character = singleCharacter.toBo()
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
