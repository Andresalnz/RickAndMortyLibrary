//
//  ListCharactersViewModel.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import Foundation

final class ListCharactersViewModel: ObservableObject {
    
    //MARK: - Variables
    
    private let interactorRickAndMorty: InteractorRickAndMorty = InteractorRickAndMorty()
    
    //Array que almacena los personajes
    @Published var characters: [CharactersResultsBO] = []
    @Published var episodes: [EpisodeInfoBO] = []
    @Published var locations: [LocationsResultsBO] = []
    
    //Manejo de errores
    @Published var errorValue = false
    @Published var messageError: String = ""
    
    //Almacena la actual pagina
    var currentPage: Int = 1
    
    //Booleano para cuando se esta en el detalle y se vuelva atras no haga ninguna petición
    var negativeRequest: Bool = false
    
    //Propiedad que almacena el texto que se esta buscando
    @Published var searchText: String = ""
    
    //MARK: - Variable computada que devuelve el un arrray de personajes segun lo que se busque
    var filterCharactersbyName: [CharactersResultsBO] {
        guard !searchText.isEmpty else { return characters }
        return characters.filter { character in
            character.name!.lowercased().contains(searchText.lowercased())
        }
    }
    //MARK: - Método que se ejecuta en el hilo principal, para realizar petición y cargar mas personajes al llegar al final de la lista
    @MainActor
    func loadMoreIfNeeded(characterInfo: CharactersResultsBO) async throws {
        if characters.last == characterInfo {
            currentPage += 1
            var moreCharacters: [CharactersResultsBO] = []
            moreCharacters = try await interactorRickAndMorty.allCharacters(currentPage)
            characters.append(contentsOf: moreCharacters)
        }
    }

    //MARK: - Método para uso en la vista, para pintar todo lo necesario
    func loadUI() {
        Task {
            try await loadData()
        }
    }
    
    //MARK: - Método que se ejecuta en el hilo principal, para realizar petición y cargar los primeros personajes
    @MainActor
    func loadData() async throws {
        do {
            if !negativeRequest {
                characters = try await interactorRickAndMorty.allCharacters(currentPage)
                episodes = try await interactorRickAndMorty.allEpisodes()
                locations = try await interactorRickAndMorty.allLocations()
            }
            negativeRequest = true
        } catch {
            errorValue = true
            if let message = ErrorHandler.requestCharactersInvalid.errorDescription {
                messageError = message
            }
            throw ErrorHandler.requestCharactersInvalid
        }
    }
}
