//
//  RMFirebaseFirestore.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 15/2/24.
//

import Foundation
import FirebaseFirestore

struct RMFirebaseFirestore {
    private let database = Firestore.firestore()
    
    //MARK: - Crear colecciones
    //Personajes
    func createFavsCharacters(model: Detail, collection: String) async throws {
        do {
            let character: [String: Any] = [
                "name": model.name ?? "",
                "status": model.status?.rawValue ?? "",
                "species": model.species?.rawValue ?? "",
                "type": model.type ?? "",
                "gender": model.gender?.rawValue ?? "",
                "origin": model.origin?.name ?? "",
                "location": model.location?.name ?? "",
                "image": model.image?.description ?? ""
            ]
            
            try await database.collection(collection).addDocument(data: character)
        } catch {
            throw ErrorHandler.FirestoreNotSaveDocument
        }
    }
    
    //Episodios
    func createFavsEpisodes(model: Detail, collection: String) async throws {
        
        let episode: [String: Any] = [
            "name": model.name ?? "",
            "airDate": model.airDate ?? "",
            "episode": model.episode ?? "",
        ]
        
        do {
            try await database.collection(collection).addDocument(data: episode)
        } catch {
            throw ErrorHandler.FirestoreNotSaveDocument
        }
    }
    
    //Localizaciones
    func createFavsLocations(model: Detail, collection: String) async throws {
        let location: [String: Any] = [
            "name": model.name ?? "",
            "type": model.type ?? "",
            "dimension": model.dimension ?? "",
        ]
        
        do {
            try await database.collection(collection).addDocument(data: location)
        } catch {
            throw ErrorHandler.FirestoreNotSaveDocument
        }
    }
    
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
