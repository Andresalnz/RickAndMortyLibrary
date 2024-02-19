//
//  FavouritesViewModel.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 31/1/24.
//

import Foundation

final class FavouritesViewModel: ObservableObject {
    
    //MARK: - Variables
    
    //@Publised
    @Published var characters: [FirebaseFirestoreCharacterModel] = []
    @Published var episodes: [FirebaseFirestoreEpisodeLocationModel] = []
    @Published var locations: [FirebaseFirestoreEpisodeLocationModel] = []
    @Published var typeList: TypeViewList
    
    //interactor
    private let interactor: Interactor
    
    //MARK: - Init
    init(interactor: Interactor = Interactor.shared, typeList: TypeViewList) {
        self.interactor = interactor
        self.typeList = typeList
    }
    
    //MARK: - loadUI
    func loadUI() {
        Task {
         try  await loadData()
        }
    }
    
    func loadDelete(id: String?) {
        Task {
            if let id = id {
                try await actionDelete(id: id)                
            }
        
        }
        loadUI()
    }
    func actionDelete(id: String?) async throws {
        if let id = id {
            try await interactor.delete(id: id)
        }
    }
    
    //MARK: - loadData
    func loadData() async throws {
        switch typeList {
            case .characters:
                let getFavouritesCharacters = try await interactor.getAllDocumentsFavouritesCharacters(collection: Constants.collectionCharacter)
                await MainActor.run {
                    self.characters = getFavouritesCharacters
                }
            case .locations:
                let getFavouritesLocations = try await interactor.getAllDocumentsFavouritesEpisodes(collection: Constants.collectionLocations)
                await MainActor.run {
                    self.locations = getFavouritesLocations
                }
            case .episodes:
                let getFavouritesEpisodes = try await interactor.getAllDocumentsFavouritesEpisodes(collection: Constants.collectionEpisodes)
                await MainActor.run {
                    self.episodes = getFavouritesEpisodes
                }
        }
    }
}
