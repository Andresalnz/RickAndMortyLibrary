//
//  LocationRepository.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/11/23.
//

import Foundation

final class LocationRepository {
    //MARK: - All Locations
    func getAllLocations(url: URL?) async throws -> [LocationResultsBO] {
        guard let url = url else { throw ErrorHandler.invalidUrl }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let rickAndMortyModel = try JSONDecoder().decode(LocationModelDTO.self, from: data)
            if let rickAndMortyLocations = rickAndMortyModel.locations {
                let locations = rickAndMortyLocations.compactMap { $0.toBo() }
                return locations
            } else {
                throw ErrorHandler.requestCharactersInvalid
            }
        } catch let err {
            print(err)
            throw ErrorHandler.requestEpisodeInvalid
        }
    }
}
