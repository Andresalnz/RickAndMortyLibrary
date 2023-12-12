//
//  CharacterRepository.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 15/11/23.
//

import Foundation

final class CharacterRepository {
    //MARK: -
    func getAllCharacters(url: URL?) async throws -> [CharactersResultsBO] {
        guard let url = url else { throw ErrorHandler.invalidUrl }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let rickAndMortyModel = try JSONDecoder().decode(CharacterModelDTO.self, from: data)
            if let rickAndMortyCharacters = rickAndMortyModel.characters {
                let characters = rickAndMortyCharacters.compactMap { $0.toBo() }
                return characters
            } else {
                throw ErrorHandler.listCharactersEmptyOrDataEmpty
            }
        } catch {
            throw ErrorHandler.requestCharactersInvalid
        }
    }
    
    //MARK: - Single Character
    func getSingleCharacter(url: URL?) async throws -> CharactersResultsBO {
        guard let url = url else {  throw ErrorHandler.invalidUrl }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let singleCharacterModel = try JSONDecoder().decode(CharactersResultsDTO.self, from: data)
            let singleCharacter = singleCharacterModel.toBo()
            return singleCharacter
        } catch {
            throw ErrorHandler.requestEpisodeInvalid
        }
    }
}
