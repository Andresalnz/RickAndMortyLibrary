//
//  CharacterModelBO.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import Foundation

struct CharacterModelBO: Codable {
    let info: InfoBO?
    let characters: [CharactersInfoBO]?
    
    enum CodingKeys: String, CodingKey {
        case info
        case characters = "results"
    }
}

struct InfoBO: Codable {
    let count: Int?
    let pages: Int?
    let next: URL?
    let prev: URL?
    
}

struct CharactersInfoBO: Codable {
    let id: Int?
    let name: String?
    let status: Status?
    let species: Species?
    let type: String?
    let gender: Gender?
    let origin, location: LocationOriginBO?
    let image: URL?
    let episode: [String]?
    let url: URL?
    let created: Date?
}


struct LocationOriginBO: Codable {
    let name: String?
    let url: URL?
}

//MARK: - enum Gender, Species & Status

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
    case Humanoid = "Humanoid"
    case unknown = "unknown"
    case Poopybutthole = "Poopybutthole"
    case MythologicalCreature = "Mythological Creature"
    case Animal = "Animal"
    case Robot = "Robot"
    case Cronenberg = "Cronenberg"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}


/*
 {
   "info": {
     "count": 826,
     "pages": 42,
     "next": "https://rickandmortyapi.com/api/character/?page=2",
     "prev": null
   },
   "results": [
     {
       "id": 1,
       "name": "Rick Sanchez",
       "status": "Alive",
       "species": "Human",
       "type": "",
       "gender": "Male",
       "origin": {
         "name": "Earth",
         "url": "https://rickandmortyapi.com/api/location/1"
       },
       "location": {
         "name": "Earth",
         "url": "https://rickandmortyapi.com/api/location/20"
       },
       "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
       "episode": [
         "https://rickandmortyapi.com/api/episode/1",
         "https://rickandmortyapi.com/api/episode/2",
         // ...
       ],
       "url": "https://rickandmortyapi.com/api/character/1",
       "created": "2017-11-04T18:48:46.250Z"
     },
 */
