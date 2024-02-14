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
    @Published var info: [RowDetail] = []
    @Published var characters: [RowDetail] = []
    @Published var episodes: [RowDetail] = []
    @Published var locations: [RowDetail] = []
    @Published var typeList: TypeViewList = .characters
    
    //interactor
    private let interactor: Interactor
    
    //MARK: - Init
    init(interactor: Interactor = Interactor.shared) {
        self.interactor = interactor
    }
    
    //MARK: - loadUI
    func loadUI() {
        Task {
         try  await loadData()
        }
    }
    
    //MARK: - Metodos Filter
    func filterCharacters()  {
        characters = info.filter { $0.gender?.rawValue != nil }
        typeList = .characters
    }
    
    func filterEpisodes()  {
        episodes = info.filter { $0.airDate != nil }
        typeList = .episodes
    }
    
    func filterLocation()  {
        locations = info.filter { $0.dimension != nil }
        typeList = .locations
        
    }
    
    //MARK: - loadData
    func loadData() async throws {
        let infoFavourites = try await  interactor.getAllFavourites()
        await MainActor.run {
            self.info = infoFavourites
        }
    }
}
