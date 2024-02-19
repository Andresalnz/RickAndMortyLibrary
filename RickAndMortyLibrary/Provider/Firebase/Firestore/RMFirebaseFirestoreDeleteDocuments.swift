//
//  RMFirebaseFirestoreDeleteDocuments.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/2/24.
//

import Foundation
import FirebaseFirestore

final class RMFirebaseFirestoreDeleteDocuments {
    private let database = Firestore.firestore()
    
    func delete(collection: String, id: String) async throws  {
        try await database.collection(collection).document(id).delete()
    }
}
