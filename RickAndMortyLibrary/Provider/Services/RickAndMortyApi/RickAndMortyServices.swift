//
//  RickAndMortyServices.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import Foundation

final class RickAndMortyServices {
   
    func getSingleEpisode(url: URL?) async throws -> EpisodeModelBO {
        guard let url = url else {  throw ErrorHandler.invalidUrl }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let singleEpisodeModel = try JSONDecoder().decode(EpisodeModelDTO.self, from: data)
            let singleEpisode = singleEpisodeModel.toBo()
            return singleEpisode
        } catch {
            throw ErrorHandler.requestEpisodeInvalid
        }
    }
}
