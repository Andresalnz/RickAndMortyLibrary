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
