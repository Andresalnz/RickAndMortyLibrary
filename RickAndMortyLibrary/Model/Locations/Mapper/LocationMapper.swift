//
//  LocationMapper.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/11/23.
//

import Foundation

extension LocationsResultsDTO {
    func toBo() -> LocationsResultsBO {
        var urlresidents: [URL] = []
        residents?.forEach({ resident in
            if let resident = URL(string: resident) {
                urlresidents.append(resident)
            }
        })
        return LocationsResultsBO(id: id,
                                  name: name,
                                  type: type,
                                  dimension: dimension,
                                  residents: urlresidents,
                                  url: URL(string: url ?? ""),
                                  created: Date())
    }
}

