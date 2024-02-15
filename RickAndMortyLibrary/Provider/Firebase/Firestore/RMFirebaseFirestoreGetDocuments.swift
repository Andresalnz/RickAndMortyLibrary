//
//  RMFirebaseFirestoreGetDocuments.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 15/2/24.
//

import Foundation
import FirebaseFirestore

struct RMFirebaseFirestoreGetDocuments {
    private let database = Firestore.firestore()
    //MARK: - Obtener colecciones
    func getDocuments<T>(collection: String, type: T.Type) async throws -> [T] where T: Codable {
        do {
            let querySnapchot = try await database.collection(collection).getDocuments()
            return querySnapchot.documents.compactMap { try? $0.data(as: type) }
        } catch {
            throw ErrorHandler.FirestoreNotGetDocuments
        }
    }
}
