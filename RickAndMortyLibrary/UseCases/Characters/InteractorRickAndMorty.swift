//
//  InteractorCharacter.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 15/11/23.
//

import Foundation

final class InteractorRickAndMorty {
    
    let repositoryCharacters = CharacterRepository()
    let repositoryEpisodes = EpisodeRepository()
  
    //MARK: - Characters
    func allCharacters (_ page: Int) async throws -> [CharactersInfoBO] {
        return try await repositoryCharacters.getAllCharacters(url: Util.Services.allCharacters.shapeURL(page))
    }
    
    //MARK: - Episodes
    
    //Single episode
    func singleEpisode(url: URL?) async throws -> EpisodeInfoBO? {
        return try await repositoryEpisodes.getSingleEpisode(url: url)
    }
}
