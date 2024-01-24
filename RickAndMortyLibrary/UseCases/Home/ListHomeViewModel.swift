//
//  ListCharactersViewModel.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import Foundation

final class ListHomeViewModel: ObservableObject {
    
    //MARK: - Variables
    
    //Interactor
    private let interactor: Interactor
    
    //MARK: - Published
    //Array que almacena la informacion
    @Published var characters: [CharactersResultsBO]
    @Published var episodes: [EpisodeResultsBO]
    @Published var locations: [LocationResultsBO]
    
    //Manejo de errores
    @Published var errorMsg = ""
    @Published var showAlert = false
    
    //MARK: - Init
    init(interactor: Interactor = Interactor.shared, characters: [CharactersResultsBO] = [], episodes: [EpisodeResultsBO] = [], locations: [LocationResultsBO] = []) {
        self.interactor = interactor
        self.characters = characters
        self.episodes = episodes
        self.locations = locations
    }
    
    
    //MARK: - Variable computada que devuelve el un arrray de personajes segun lo que se busque
//    var filterCharactersbyName: [CharactersResultsBO] {
//        guard !searchText.isEmpty else { return characters }
//        return characters.filter { character in
//            character.name!.lowercased().contains(searchText.lowercased())
//        }
//    }
//    
//    //MARK: - Variable computada que devuelve el un arrray de eppisodios segun lo que se busque
//    var filterEpisodes: [EpisodeResultsBO] {
//        guard !searchText.isEmpty else { return episodes }
//        return episodes.filter { episode in
//            episode.name!.lowercased().contains(searchText.lowercased())
//        }
//    }
//    
//    //MARK: - Variable computada que devuelve el un arrray de localizaciones segun lo que se busque
//    var filterLocations: [LocationResultsBO] {
//        guard !searchText.isEmpty else { return locations }
//        return locations.filter { location in
//            location.name!.lowercased().contains(searchText.lowercased())
//        }
//    }
    
    
    
    //Booleano para cuando se esta en el detalle y se vuelva atras no haga ninguna petición
   // var negativeRequest: Bool = false
    
    //Propiedad que almacena el texto que se esta buscando
    @Published var searchText: String = ""
    
  
//    //MARK: - Método que se ejecuta en el hilo principal, para realizar petición y cargar mas personajes al llegar al final de la lista
//    @MainActor
//    func loadMoreIfNeeded(characterInfo: CharactersResultsBO) async throws {
//        if characters.last == characterInfo {
//            currentPage += 1
//            var moreCharacters: [CharactersResultsBO] = []
//            moreCharacters = try await interactorRickAndMorty.allCharacters()
//            characters.append(contentsOf: moreCharacters)
//        }
//    }
    
    

    //MARK: - Método para uso en la vista, para pintar todo lo necesario
    func loadUI() {
        Task {
            try await loadData()
        }
    }
    
    //MARK: - Método que se ejecuta en el hilo principal, para realizar petición y cargar los primeros personajes
    func loadData() async throws {
        do {
            let getAllCharacters = try await interactor.getAllCharacters()
            let getAllEpisodes = try await interactor.getAllEpisodes()
            let getAllLocations = try await interactor.getAllLocations()
            await MainActor.run {
                if let infoCharacters = getAllCharacters.characters {
                    self.characters = infoCharacters.compactMap { $0.toBo() }
                    
                }
                
                if let infoEpisodes = getAllEpisodes.episodes {
                    self.episodes = infoEpisodes.compactMap { $0.toBo() }
                }
                
                if let infoLocations = getAllLocations.locations {
                    self.locations = infoLocations.compactMap { $0.toBo() }
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
