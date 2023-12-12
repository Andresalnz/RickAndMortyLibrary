//
//  DetailModelVO.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 21/11/23.
//

import Foundation

struct RowDetail: Codable, Detail {
    var airDate: String?
    var episode: String?
    var characters: [URL]?
    var dimension: String?
    var residents: [URL]?
    var type: String?
    var status: Status?
    var gender: Gender?
    var origin: LocationOriginBO?
    var location: LocationOriginBO?
    var episodes: [URL]?
    var image: URL?
    var name: String?
    var species: Species?
}
