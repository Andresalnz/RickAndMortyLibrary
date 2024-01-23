//
//  Util.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import Foundation

final class Util {
    
    //MARK: - metodo para crear la URL
    enum Services {
        case allCharacters
        case allEpisodes
        case allLocations
        
        func shapeURL() -> URL? {
            switch self {
                case .allCharacters:
                    return URL(string: "\(Constants.uri + Constants.characters)")
                case .allEpisodes:
                    return URL(string: "\(Constants.uri + Constants.episodes)")
                case .allLocations:
                    return URL(string: "\(Constants.uri + Constants.locations)")
            }
        }
    }
}
