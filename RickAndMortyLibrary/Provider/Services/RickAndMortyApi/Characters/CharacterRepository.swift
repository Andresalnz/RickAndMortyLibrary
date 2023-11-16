//
//  CharacterRepository.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 15/11/23.
//

import Foundation

final class CharacterRepository {
    //MARK: -
    func getAllCharacters(url: URL?) async throws -> [CharactersInfoBO] {
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
}
