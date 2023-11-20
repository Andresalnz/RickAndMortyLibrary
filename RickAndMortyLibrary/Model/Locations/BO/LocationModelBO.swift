//
//  LocationModelBO.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/11/23.
//

import Foundation

struct LocationModelBO: Codable {
    let info: [InfoLocationBO]
    let locations: [LocationsResultsBO]
    
    enum CodingKeys: String, CodingKey {
        case info
        case locations = "results"
    }
}

struct InfoLocationBO: Codable {
    let count: Int?
    let pages: Int?
    let next: URL?
    let prev: URL?
}

struct LocationsResultsBO: Codable {
    let id: Int?
    let name: String?
    let type: String?
    let dimension: String?
    let residents: [URL]?
    let url: URL?
    let created: Date?
}
