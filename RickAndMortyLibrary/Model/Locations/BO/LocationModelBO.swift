//
//  LocationModelBO.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/11/23.
//

import Foundation

struct LocationModelBO: Codable {
    let info: [InfoLocationBO]?
    let locations: [LocationsResultsBO]?
    
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
    let home: RowListAndDetail
    let id: Int?
    let name: String?
    let type: String?
    let dimension: String?
    let residents: [URL]?
    let url: URL?
    let created: Date?
    
    init(home: RowListAndDetail, id: Int?, name: String?, type: String?, dimension: String?, residents: [URL]?, url: URL?, created: Date?) {
        self.home = RowListAndDetail(name: name)
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.url = url
        self.created = created
    }
}
