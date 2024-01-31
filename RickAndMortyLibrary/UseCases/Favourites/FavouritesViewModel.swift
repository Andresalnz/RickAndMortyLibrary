//
//  FavouritesViewModel.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 31/1/24.
//

import Foundation

final class FavouritesViewModel: ObservableObject {
    @Published var info: [RowDetail] = []
    
    private let interactor: Interactor
    
    init(interactor: Interactor = Interactor.shared) {
        self.interactor = interactor
    }
  
    func loadUI() {
        Task {
            loadData()
        }
    }
    
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
