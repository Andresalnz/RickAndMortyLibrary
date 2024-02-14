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
    
    static let shared: Interactor = Interactor(repository: Repository())
    
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
    
    func getAllFavourites() async throws -> [RowDetail] {
        return try await repository.getFav()
    }
    
    func createFavourite(infoFavourite: Detail, completionBlock: @escaping (Result<Detail, Error>) -> Void) {
        return repository.createNewFavourite(character: infoFavourite, completionBlock: completionBlock)
    }
    
}
