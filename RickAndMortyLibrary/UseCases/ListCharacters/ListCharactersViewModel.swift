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
    
    //Instancia de la clase del servicio, para el uso de los metodos que hacen las peticiones a la API
    let service: RickAndMortyServices = RickAndMortyServices()
    
    
    //MARK: - Método para uso en la vista, para pintar todo lo necesario
    func loadUI() {
        Task {
            await loadData()
        }
    }
    
    //MARK: - Método que se ejecuta en el hilo principal, para guardar todos los datos
    @MainActor
    func loadData() async {
        do {
            characters = try await service.getRickAndMorty(url: Util.Services.characters.shapeURL())
        } catch let err {
            print(err)
        }
    }
    
}
