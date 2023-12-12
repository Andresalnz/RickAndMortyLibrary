//
//  EpisodeModelBO.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/10/23.
//

import Foundation


struct EpisodeModelBO: Codable {
    let info: EpisodeInfoBO?
    let episodes: [EpisodeResultsBO]?
}

struct EpisodeInfoBO: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

struct EpisodeResultsBO: Codable, Hashable {
    static func == (lhs: EpisodeResultsBO, rhs: EpisodeResultsBO) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.airDate == rhs.airDate &&
        lhs.episode == rhs.episode &&
        lhs.characters == rhs.characters &&
        lhs.url == rhs.url &&
        lhs.created == rhs.created 
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    var rowListMain: RowListMain
    var rowDetail: RowDetail
    var id: Int?
    var name: String?
    var airDate: String?
    var episode: String?
    var characters: [URL]?
    var url: URL?
    var created: Date?
    
    init(rowListMain: RowListMain, rowDetail: RowDetail, id: Int?, name: String?, airDate: String?, episode: String?, characters: [URL]?, url: URL?, created: Date?) {
        self.rowListMain = RowListMain(name: name)
        self.rowDetail = RowDetail(airDate: airDate, episode: episode, characters: characters, name: name)
        self.id = id
        self.name = name
        self.airDate = airDate
        self.episode = episode
        self.characters = characters
        self.url = url
        self.created = created
    }
    
    enum CodingKeys: String, CodingKey {
        case rowListMain
        case rowDetail
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
