//
//  CharacterRepository.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 15/11/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Repository {
    private let database = Firestore.firestore()
    private let collection = "characters"
    
    func getJSON<T>(url: URL?, type: T.Type) async throws -> T where T: Codable {
        guard let url = url else { throw ErrorHandler.invalidUrl }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let rickAndMortyModel = try JSONDecoder().decode(type, from: data)
            return rickAndMortyModel
        } catch {
            throw ErrorHandler.requestInvalid
        }
    }
    
    func getFav() async throws -> [RowDetail] {
        do {
            let querySnapchot = try await database.collection(collection).getDocuments()
            return querySnapchot.documents.compactMap { try? $0.data(as: RowDetail.self)}
        } catch let err {
            throw ErrorHandler.invalidUrl
        }
    }

    func createNewFavourite(character: Detail, completionBlock: @escaping (Result<Detail, Error>) -> Void ) {
        do {
           let addCollection = try database.collection(collection).addDocument(from: character)
            completionBlock(.success(character))
        } catch let err {
            completionBlock(.failure(err))
        }
    }
    
}
