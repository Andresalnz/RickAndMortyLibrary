//
//  InteractorCharacter.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 15/11/23.
//

import Foundation

final class InteractorCharacter {
    
    let repository = CharacterRepository()
  
    
    func allCharacters (_ page: Int) async throws -> [CharactersInfoBO] {
        return try await repository.getAllCharacters(url: Util.Services.allCharacters.shapeURL(page))
    }
}
