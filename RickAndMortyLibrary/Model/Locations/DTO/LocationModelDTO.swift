//
//  LocationModelDTO.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/11/23.
//

import Foundation

struct LocationModelDTO: Codable {
    let info: [InfoLocationDTO]
    let locations: [LocationsResultsDTO]
    
    enum CodingKeys: String, CodingKey {
        case info
        case locations = "results"
    }
}

struct InfoLocationDTO: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

struct LocationsResultsDTO: Codable {
    let id: Int?
    let name: String?
    let type: String?
    let dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}

/*
 "info": {
     "count": 126,
     "pages": 7,
     "next": "https://rickandmortyapi.com/api/location?page=2",
     "prev": null
   },
   "results": [
     {
       "id": 1,
       "name": "Earth",
       "type": "Planet",
       "dimension": "Dimension C-137",
       "residents": [
         "https://rickandmortyapi.com/api/character/1",
         "https://rickandmortyapi.com/api/character/2",
         // ...
       ],
       "url": "https://rickandmortyapi.com/api/location/1",
       "created": "2017-11-10T12:42:04.162Z"
     }
     // ...
   ]
 }
 */
