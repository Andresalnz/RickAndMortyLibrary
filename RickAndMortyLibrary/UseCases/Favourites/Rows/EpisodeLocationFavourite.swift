//
//  EpisodeLocationFavourite.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 1/2/24.
//

import SwiftUI

struct EpisodeLocationFavourite: View {
    
    let model: FirebaseFirestoreEpisodeLocationModel
    
    var body: some View {
        HStack(spacing: 50) {
            VStack(alignment: .leading, spacing: 50) {
                Text(model.name ?? "")
                if let type = model.type {
                    Text (type)
                }
                if let airDate = model.airDate {
                    Text(airDate)
                }
            }
            if let dimension = model.dimension {
                Text(dimension)
            }
            if let episode = model.episode {
                Text(episode)
            }
        }
    }
}

#Preview {
    EpisodeLocationFavourite(model: FirebaseFirestoreEpisodeLocationModel())
}
