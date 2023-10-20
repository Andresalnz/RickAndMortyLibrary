//
//  RickAndMortyServices.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import Foundation

final class RickAndMortyServices {
    func getRickAndMorty(url: URL?) async throws -> [CharactersInfoBO] {
        guard let url = url else { return [] }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let rickAndMortyModel = try JSONDecoder().decode(CharacterModelDTO.self, from: data)
            if let rickAndMortyCharacters = rickAndMortyModel.characters {
                let characters = rickAndMortyCharacters.compactMap { $0.toBo() }
                return characters
            } else {
                return []
            }
        } catch let err {
            print("Error -> \(err)")
            return []
        }
    }
    
    
    func getSingleEpisode(url: URL?) async throws -> EpisodeModelBO {
        guard let url = url else {  throw fatalError() }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let singleEpisodeModel = try JSONDecoder().decode(EpisodeModelDTO.self, from: data)
            let singleEpisode = singleEpisodeModel.toBo()
            return singleEpisode
        } catch let err {
            print(err)
            throw fatalError()
        }
    }
}
