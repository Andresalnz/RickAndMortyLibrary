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
    
    //MARK: - Published
    
    //Propidedad que almacena todos los episodios
    @Published var allEpisodes: [EpisodeResultsBO]
    @Published var allCharacters: [CharactersResultsBO]
    
    //Manejo de errores
    @Published var errorMsg = ""
    @Published var showAlert = false
    
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
    
    func loadSave(infoFavourite: Detail) {
        Task {
            try await saveFavourite(infoFavourite: infoFavourite)
        }
    }
    
    func saveFavourite(infoFavourite: Detail) async throws {
        switch type {
            case .characters:
                try await interactor.createFavouriteCharacter(model: infoFavourite)
            case .locations:
                try await interactor.createFavouriteLocation(model: infoFavourite)
            case .episodes:
                try await interactor.createFavouriteEpisode(model: infoFavourite)
        }
    }
    
    //MARK: - Método que se ejecuta en el hilo principal, para guardar todos los datos
    func loadData() async throws {
        do {
            for urlEpisodeOrCharacter in allEpisodeCharacter {
                switch type {
                    case .characters:
                        let singleEpisode = try await interactor.singleEpisode(url: urlEpisodeOrCharacter)
                        await MainActor.run {
                            self.episode = singleEpisode.toBo()
                            if let episode = episode {
                                if allEpisodes.count < 10 {
                                    allEpisodes.append(episode)
                                }
                                
                            }
                        }
                       
                    case .episodes, .locations:
                        let singleCharacter = try await interactor.singleCharacter(url: urlEpisodeOrCharacter)
                        await MainActor.run {
                            self.character = singleCharacter.toBo()
                            if let character = character {
                                if allCharacters.count < 10 {
                                    allCharacters.append(character)
                                }
                            }
                        }
                       
                }
            }
        } catch {
            await MainActor.run {
                guard let errorDescription = ErrorHandler.requestNotWork.errorDescription else { return }
                errorMsg = errorDescription
                showAlert.toggle()
            }
        }
    }
}
