//
//  CharacterMapper.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import Foundation

extension CharactersInfoDTO {
    func toBo() -> CharactersInfoBO {
        return CharactersInfoBO(id: id,
                                name: name,
                                status: status,
                                species: species,
                                type: type,
                                gender: gender,
                                origin: origin?.toBo(),
                                location: location?.toBo(),
                                image: URL(string: image ?? ""),
                                episode: episode,
                                url: URL(string: url ?? ""),
                                created: Date())
    }
}


extension LocationOriginDTO {
    func toBo() -> LocationOriginBO {
        return LocationOriginBO(name: name,
                                url: URL(string: url ?? ""))
    }
}
