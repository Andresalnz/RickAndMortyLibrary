//
//  InteractorCharacter.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 15/11/23.
//

import Foundation

final class InteractorRickAndMorty {
    
    lazy var repositoryCharacters: CharacterRepository = {
        CharacterRepository()
    }()
    
    lazy var repositoryEpisodes: EpisodeRepository = {
        EpisodeRepository()
    }()
    
    lazy var repositoryLocations: LocationRepository = {
        LocationRepository()
    }()
    
  
  
    //MARK: - Characters
    func allCharacters (_ page: Int) async throws -> [CharactersResultsBO] {
        return try await repositoryCharacters.getAllCharacters(url: Util.Services.allCharacters.shapeURL())
    }
    
    //MARK: - Episodes
    
    //Single episode
    func singleEpisode(url: URL?) async throws -> EpisodeResultsBO? {
        return try await repositoryEpisodes.getSingleEpisode(url: url)
    }
    
    //All Episodes
    func allEpisodes() async throws -> [EpisodeResultsBO] {
        return try await repositoryEpisodes.getAllEpisodes(url: Util.Services.episodes.shapeURL())
        
    }
    
    //MARK: - Locations
    func allLocations() async throws -> [LocationResultsBO] {
        return try await repositoryLocations.getAllLocations(url: URL(string: "https://rickandmortyapi.com/api/location"))
    }
}



