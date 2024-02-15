//
//  FirebaseFirestoreCharacterModel.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 15/2/24.
//

import Foundation
import FirebaseFirestore

struct FirebaseFirestoreCharacterModel: Codable, Hashable, Identifiable {
    @DocumentID var id: String?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var origin: String?
    var location: String?
    var image: URL?
}
