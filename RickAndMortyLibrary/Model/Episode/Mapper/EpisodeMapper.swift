//
//  EpisodeMapper.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/10/23.
//

import Foundation

extension EpisodeResultsDTO {
    func toBo() -> EpisodeResultsBO {
        var urlCharacter: [URL] = []
        characters?.forEach({ character in
            if let character = URL(string: character) {
                urlCharacter.append(character)
            }
            
        })
        return EpisodeResultsBO(rowListAndDetail: RowListAndDetail(),
                             id: id,
                             name: name,
                             airDate: airDate,
                             episode: episode,
                             characters: urlCharacter,
                             url: URL(string: url ?? ""),
                             created: Date())
    }
}





