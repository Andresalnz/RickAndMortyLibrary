//
//  EpisodeModelDTO.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/10/23.
//

import Foundation


struct EpisodeModelDTO: Codable {
    let info: InfoEpisodeDTO?
    let results: [EpisodeInfoDTO]?
}

struct InfoEpisodeDTO: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

struct EpisodeInfoDTO: Codable {
    let id: Int?
    let name: String?
    let airDate: String?
    let episode: String?
    let characters: [String]?
    let url: String?
    let created: String?
    
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
   "info": {
     "count": 51,
     "pages": 3,
     "next": "https://rickandmortyapi.com/api/episode?page=2",
     "prev": null
   },
   "results": [
     {
       "id": 1,
       "name": "Pilot",
       "air_date": "December 2, 2013",
       "episode": "S01E01",
       "characters": [
         "https://rickandmortyapi.com/api/character/1",
         "https://rickandmortyapi.com/api/character/2",
         //...
       ],
       "url": "https://rickandmortyapi.com/api/episode/1",
       "created": "2017-11-10T12:56:33.798Z"
     },
     // ...
   ]
 }
 */
