//
//  EpisodeModelBO.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/10/23.
//

import Foundation


struct EpisodeModelBO: Codable {
    let id: Int?
    let name: String?
    let airDate: String?
    let episode: String?
    let characters: [URL]?
    let url: URL?
    let created: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
        case url
        case created
    }
}


/*
 {
   "id": 28,
   "name": "The Ricklantis Mixup",
   "air_date": "September 10, 2017",
   "episode": "S03E07",
   "characters": [
     "https://rickandmortyapi.com/api/character/1",
     "https://rickandmortyapi.com/api/character/2",
     // ...
   ],
   "url": "https://rickandmortyapi.com/api/episode/28",
   "created": "2017-11-10T12:56:36.618Z"
 }
 */
