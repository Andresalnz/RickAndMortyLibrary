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
        case characters
        
        func shapeURL() -> URL? {
            switch self {
                case .characters:
                    return URL(string: Constants.URLAllCharacters)
            }
        }
    }
}
