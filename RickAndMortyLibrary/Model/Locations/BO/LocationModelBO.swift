//
//  LocationModelBO.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/11/23.
//

import Foundation

struct LocationModelBO: Codable {
    let info: [LocationInfoBO]?
    let locations: [LocationResultsBO]?
    
    enum CodingKeys: String, CodingKey {
        case info
        case locations = "results"
    }
}

struct LocationInfoBO: Codable {
    let count: Int?
    let pages: Int?
    let next: URL?
    let prev: URL?
}

struct LocationResultsBO: Codable {
    let rowListMain: RowListMain
    var rowDetail: RowDetail
    let id: Int?
    let name: String?
    let type: String?
    let dimension: String?
    let residents: [URL]?
    let url: URL?
    let created: Date?
    
    init(rowListMain: RowListMain, rowDetail: RowDetail, id: Int?, name: String?, type: String?, dimension: String?, residents: [URL]?, url: URL?, created: Date?) {
        self.rowListMain = RowListMain(name: name)
        self.rowDetail = RowDetail(dimension: dimension, residents: residents, type: type, name: name)
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.url = url
        self.created = created
    }
}
