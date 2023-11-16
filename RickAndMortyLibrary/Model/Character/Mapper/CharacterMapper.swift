//
//  CharacterMapper.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import Foundation

extension CharactersInfoDTO {
    func toBo() -> CharactersInfoBO {
        
        var urlEpisodes: [URL] = []
        episode?.forEach({ episode in
            if let episode = URL(string: episode) {
                urlEpisodes.append(episode)
            }
        })
            
        return CharactersInfoBO(rowListAndDetail: RowListAndDetail(), id: id,
                                name: name,
                                status: status,
                                species: species,
                                type: type,
                                gender: gender,
                                origin: origin?.toBo(),
                                location: location?.toBo(),
                                image: URL(string: image ?? ""),
                                episode: urlEpisodes,
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
