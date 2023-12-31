//
//  CharacterModelBO.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import Foundation

struct CharacterModelBO: Codable {
    let info: CharactersInfoBO?
    let characters: [CharactersResultsBO]?
    
    enum CodingKeys: String, CodingKey {
        case info
        case characters = "results"
    }
}

struct CharactersInfoBO: Codable {
    let count: Int?
    let pages: Int?
    let next: URL?
    let prev: URL?
    
}

struct CharactersResultsBO: Codable, Equatable {
    static func == (lhs: CharactersResultsBO, rhs: CharactersResultsBO) -> Bool {
          return  lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.status == rhs.status &&
            lhs.species == rhs.species &&
            lhs.type == rhs.type &&
            lhs.gender == rhs.gender &&
            lhs.origin == rhs.origin &&
            lhs.location == rhs.location &&
            lhs.image == rhs.image &&
            lhs.episode == rhs.episode &&
            lhs.url == rhs.url &&
            lhs.created == rhs.created
        }
    
    var rowListMain: RowListMain
    var rowDetail: RowDetail
    var id: Int?
    var name: String?
    var status: Status?
    var species: Species?
    var type: String?
    var gender: Gender?
    var origin, location: LocationOriginBO?
    var image: URL?
    var episode: [URL]?
    var url: URL?
    var created: Date?
    
    init(rowListMain: RowListMain, rowDetail: RowDetail, id: Int? = nil, name: String? = nil, status: Status? = nil, species: Species? = nil, type: String? = nil, gender: Gender? = nil, origin: LocationOriginBO? = nil, location: LocationOriginBO? = nil, image: URL? = nil, episode: [URL]? = nil, url: URL? = nil, created: Date? = nil) {
        self.rowListMain = RowListMain(image: image, name: name, species: species)
        self.rowDetail = RowDetail(status: status, gender: gender, origin: origin, location: location, episodes: episode, image: image, name: name, species: species)
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}

struct LocationOriginBO: Codable, Equatable {
    let name: String?
    let url: URL?
}

//MARK: - enum Gender, Species & Status

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
    case Genderless = "Genderless"
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
    case Disease = "Disease"
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
