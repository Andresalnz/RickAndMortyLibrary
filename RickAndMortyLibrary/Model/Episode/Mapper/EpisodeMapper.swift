//
//  EpisodeMapper.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/10/23.
//

import Foundation

extension EpisodeInfoDTO {
    func toBo() -> EpisodeInfoBO {
        var urlCharacter: [URL] = []
        characters?.forEach({ character in
            if let character = URL(string: character) {
                urlCharacter.append(character)
            }
            
        })
        return EpisodeInfoBO(rowListAndDetail: RowListAndDetail(),
                             id: id,
                             name: name,
                             airDate: airDate,
                             episode: episode,
                             characters: urlCharacter,
                             url: URL(string: url ?? ""),
                             created: Date())
    }
}





