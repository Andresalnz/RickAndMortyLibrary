//
//  HomeModelVO.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/11/23.
//

import Foundation

struct RowListMain: Codable, HomeRowView {
    var image: URL?
    var name: String?
    var species: Species?
}

struct RowDetail: Codable, DetailView {
    var status: Status?
    var gender: Gender?
    var origin: LocationOriginBO?
    var location: LocationOriginBO?
    var episodes: [URL]?
    var image: URL?
    var name: String?
    var species: Species?
}
