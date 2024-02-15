//
//  FirebaseFirestoreEpisodeModel.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 15/2/24.
//

import Foundation
import FirebaseFirestore

struct FirebaseFirestoreEpisodeLocationModel: Codable, Hashable, Identifiable, DetailEpisode, DetailLocation {
    @DocumentID var id: String?
    var name: String?
    var airDate: String?
    var episode: String?
    var characters: [URL]?
    var type: String?
    var dimension: String?
    var residents: [URL]?
}
