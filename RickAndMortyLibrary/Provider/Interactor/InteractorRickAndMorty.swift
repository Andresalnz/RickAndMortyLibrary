//
//  InteractorCharacter.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 15/11/23.
//

import Foundation
import FirebaseFirestore

protocol RickAndMortyInteractor {
    func getAllCharacters() async throws -> CharacterModelDTO
    func getAllEpisodes() async throws -> EpisodeModelDTO
    func getAllLocations() async throws -> LocationModelDTO
    func singleCharacter(url: URL?) async throws -> CharactersResultsDTO
    func singleEpisode(url: URL?) async throws -> EpisodeResultsDTO
}

struct Interactor: RickAndMortyInteractor {
    
    var repository: Repository
    var firebaseFirestore: RMFirebaseFirestore
    
    static let shared: Interactor = Interactor(repository: Repository(), firebaseFirestore: RMFirebaseFirestore())
    
    //MARK: - Characters
    
    //allCharacters
    func getAllCharacters() async throws -> CharacterModelDTO {
        return try await repository.getJSON(url: Util.Services.allCharacters.shapeURL(), type: CharacterModelDTO.self)
    }
    
    //singleCharacter
    func singleCharacter(url: URL?) async throws -> CharactersResultsDTO {
        return try await repository.getJSON(url: url, type: CharactersResultsDTO.self)
    }
    
    //MARK: - Episodes
    
    //allEpisodes
    func getAllEpisodes() async throws -> EpisodeModelDTO {
        return try await repository.getJSON(url: Util.Services.allEpisodes.shapeURL(), type: EpisodeModelDTO.self)
    }
    
    
    //singleEpisode
    func singleEpisode(url: URL?) async throws -> EpisodeResultsDTO {
        return try await repository.getJSON(url: url, type: EpisodeResultsDTO.self)
    }
    

    
    //MARK: - Location
    
    //allLocations
    func getAllLocations() async throws -> LocationModelDTO {
        return try await repository.getJSON(url: Util.Services.allLocations.shapeURL(), type: LocationModelDTO.self)
    }
    
    //MARK: - Firebase
    //Obtener documentos de favoritod de personajes
    func getAllDocumentsFavouritesCharacters(collection: String) async throws -> [FirebaseFirestoreCharacterModel] {
        return try await firebaseFirestore.getDocuments(collection: collection, type: FirebaseFirestoreCharacterModel.self)
    }
    //Obtener documentos de favoritos de localizaciones y episodios
    func getAllDocumentsFavouritesEpisodes(collection: String) async throws -> [FirebaseFirestoreEpisodeLocationModel] {
        return try await firebaseFirestore.getDocuments(collection: collection, type: FirebaseFirestoreEpisodeLocationModel.self)
    }
    
    
    
    
    //Guardar documento como favorito
    func createFavouriteCharacter(model: Detail) async throws {
        try await firebaseFirestore.createFavsCharacters(model: model, collection: Constants.collectionCharacter)
    }
    
    func createFavouriteEpisode(model: Detail) async throws {
        try await firebaseFirestore.createFavsEpisodes(model: model, collection: Constants.collectionEpisodes)
    }
    
    func createFavouriteLocation(model: Detail) async throws {
        try await firebaseFirestore.createFavsLocations(model: model, collection: Constants.collectionLocations)
    }
    
}
