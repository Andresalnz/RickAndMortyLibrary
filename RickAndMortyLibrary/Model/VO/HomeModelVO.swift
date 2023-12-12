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
