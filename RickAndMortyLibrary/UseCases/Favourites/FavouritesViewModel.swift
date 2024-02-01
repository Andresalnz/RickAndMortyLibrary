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
            loadData()
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
    func loadData()  {
        interactor.getAllFavourites { result in
            switch result {
                case .success(let info):
                    self.info = info
                case .failure(let err):
                    print("Error en getAllCharacters \(err)")
            }
        }
    }
}
