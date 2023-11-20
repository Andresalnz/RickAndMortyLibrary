//
//  DetailCharacterViewModel.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import Foundation

final class DetailCharacterViewModel: ObservableObject {
    
    //MARK: - Variables
    
    private let episodeInteractor: InteractorRickAndMorty = InteractorRickAndMorty()
    
    //Propiedad que almacena las URL de los episodios del personaje elegido
    let allEpisodeCharacter: [URL]
    
    //Propidedad que almacena todos los episodios
    @Published var allEpisodes: [EpisodeResultsBO] = []
    
    //Propiedad que almacena un solo episodio
    var episode: EpisodeResultsBO?
    
    //MARK: - Init
    init(allEpisodeCharacter: [URL]) {
        self.allEpisodeCharacter = allEpisodeCharacter
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
                episode = try await episodeInteractor.singleEpisode(url: urlEpisode)
                if let episode = episode {
                    allEpisodes.append(episode)
                }
            }
        } catch {
            throw ErrorHandler.requestEpisodeInvalid
        }
    }
}
