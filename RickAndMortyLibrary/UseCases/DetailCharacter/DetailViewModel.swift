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
    
    var currentIndex = 0
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
    
    func remove() {
        self.allEpisodes.removeAll()
        self.allEpisodes.removeAll()
        currentIndex = 0
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
            switch type {
                case .characters:
                    let nextLimit = min(currentIndex + 5, allEpisodeCharacter.count)
                    for urlEpisodeOrCharacter in currentIndex..<allEpisodeCharacter.count  {
                        let singleEpisode = try await interactor.singleEpisode(url: allEpisodeCharacter[urlEpisodeOrCharacter])
                        await MainActor.run {
                            self.episode = singleEpisode.toBo()
                            if let episode = episode {
                                if nextLimit > allEpisodes.count {
                                    allEpisodes.append(episode)
                                    currentIndex = nextLimit
                                }
                            }
                        }
                    }
                case .episodes, .locations:
                    let nextLimit = min(currentIndex + 5, allEpisodeCharacter.count)
                    for urlEpisodeOrCharacter in currentIndex..<allEpisodeCharacter.count  {
                        let singleCharacter = try await interactor.singleCharacter(url: allEpisodeCharacter[urlEpisodeOrCharacter])
                        await MainActor.run {
                            self.character = singleCharacter.toBo()
                            if let character = character {
                                if nextLimit > allCharacters.count {
                                    allCharacters.append(character)
                                    currentIndex = nextLimit
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
