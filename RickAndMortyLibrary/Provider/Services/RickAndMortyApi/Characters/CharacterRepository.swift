//
//  CharacterRepository.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 15/11/23.
//

import Foundation

struct Repository {
    func getJSON<T>(url: URL?, type: T.Type) async throws -> T where T: Codable {
        guard let url = url else { throw ErrorHandler.invalidUrl }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let rickAndMortyModel = try JSONDecoder().decode(type, from: data)
            return rickAndMortyModel
        } catch {
            throw ErrorHandler.requestCharactersInvalid
        }
    }
}


final class CharacterRepository {
    
    
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
