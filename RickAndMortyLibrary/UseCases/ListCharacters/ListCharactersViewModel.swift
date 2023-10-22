//
//  ListCharactersViewModel.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import Foundation

final class ListCharactersViewModel: ObservableObject {
    
    //MARK: - Variables
    
    //Array que almacena los personajes
    @Published var characters: [CharactersInfoBO] = []
    
    //Manejo de errores
    @Published var errorValue = false
    @Published var messageError: String = ""
    
    //Almacena la actual pagina
    var currentPage: Int = 1
    
    //Booleano para cuando se esta en el detalle y se vuelva atras no haga ninguna petición
    var negativeRequest: Bool = false

    //Instancia de la clase del servicio, para el uso de los metodos que hacen las peticiones a la API
    let service: RickAndMortyServices = RickAndMortyServices()
    
    //MARK: - Método que se ejecuta en el hilo principal, para realizar petición y cargar mas personajes al llegar al final de la lista
    @MainActor
    func loadMoreIfNeeded(characterInfo: CharactersInfoBO) async throws {
        if characters.last == characterInfo {
            currentPage += 1
            var moreCharacters: [CharactersInfoBO] = []
            moreCharacters = try await service.getRickAndMorty(url: Util.Services.characters.shapeURL(currentPage))
            characters.append(contentsOf: moreCharacters)
        }
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
            if !negativeRequest {
                characters = try await service.getRickAndMorty(url: Util.Services.characters.shapeURL(currentPage))
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
