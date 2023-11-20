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
    
  
  
    //MARK: - Characters
    func allCharacters (_ page: Int) async throws -> [CharactersInfoBO] {
        return try await repositoryCharacters.getAllCharacters(url: Util.Services.allCharacters.shapeURL())
    }
    
    //MARK: - Episodes
    
    //Single episode
    func singleEpisode(url: URL?) async throws -> EpisodeInfoBO? {
        return try await repositoryEpisodes.getSingleEpisode(url: url)
    }
    
    //All Episodes
    func allEpisodes() async throws -> [EpisodeInfoBO] {
        return try await repositoryEpisodes.getAllEpisodes(url: Util.Services.episodes.shapeURL())
        
    }
}



