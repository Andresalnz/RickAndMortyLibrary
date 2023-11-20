//
//  EpisodeRepository.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 17/11/23.
//

import Foundation

final class EpisodeRepository {
    func getSingleEpisode(url: URL?) async throws -> EpisodeResultsBO {
        guard let url = url else {  throw ErrorHandler.invalidUrl }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let singleEpisodeModel = try JSONDecoder().decode(EpisodeResultsDTO.self, from: data)
            let singleEpisode = singleEpisodeModel.toBo()
            return singleEpisode
        } catch {
            throw ErrorHandler.requestEpisodeInvalid
        }
    }
    
    func getAllEpisodes(url: URL?) async throws -> [EpisodeResultsBO] {
        guard let url = url else { throw ErrorHandler.invalidUrl }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let rickAndMortyModel = try JSONDecoder().decode(EpisodeModelDTO.self, from: data)
            if let rickAndMortyCharacters = rickAndMortyModel.episodes {
                let episodes = rickAndMortyCharacters.compactMap { $0.toBo() }
                return episodes
            } else {
                throw ErrorHandler.requestCharactersInvalid
            }
        } catch {
            throw ErrorHandler.requestEpisodeInvalid
        }
    }
}
