//
//  ErrorHandler.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/10/23.
//

import Foundation

//MARK: - ErrorHandler
enum ErrorHandler: String, Error {
    case invalidUrl
    case listCharactersEmptyOrDataEmpty
    case requestCharactersInvalid
    case requestEpisodeInvalid
    
    public var errorDescription: String? {
        switch self {
            case .invalidUrl:
                return NSLocalizedString("URL invalida", comment: "La url introducida es invalida")
            case .listCharactersEmptyOrDataEmpty:
                return NSLocalizedString("Lista de personajes vacia", comment: "La respuesta a la peticion da un array vacino")
            case .requestCharactersInvalid:
                return NSLocalizedString("Petición de personajes invalida", comment: "La petición ha sido invalidada")
            case .requestEpisodeInvalid:
                return NSLocalizedString("Petición de episodio invalida", comment: "La petición ha sido invalidada")
        }
    }
}
