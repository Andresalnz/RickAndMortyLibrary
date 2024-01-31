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
    
    func getAllCharacters(completionBlock: @escaping (Result<[RowDetail], Error>) -> Void) {
        
        database.collection(collection)
            .addSnapshotListener { query, error in
                if let error = error {
                    print ("Error Firebase \(error.localizedDescription)")
                    completionBlock(.failure(error))
                    return
                }
                
                guard let documents = query?.documents  else {
                    completionBlock(.success([]))
                    return
                }
                
                let character = documents.compactMap {try? $0.data(as: RowDetail.self)}
                completionBlock(.success(character))
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
