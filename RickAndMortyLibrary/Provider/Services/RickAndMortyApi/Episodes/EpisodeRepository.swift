//
//  EpisodeRepository.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 17/11/23.
//

import Foundation

final class EpisodeRepository {
    func getSingleEpisode(url: URL?) async throws -> EpisodeInfoBO {
        guard let url = url else {  throw ErrorHandler.invalidUrl }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let singleEpisodeModel = try JSONDecoder().decode(EpisodeInfoDTO.self, from: data)
            let singleEpisode = singleEpisodeModel.toBo()
            return singleEpisode
        } catch {
            throw ErrorHandler.requestEpisodeInvalid
        }
    }
}
