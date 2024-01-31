//
//  FavouritesView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 31/1/24.
//

import SwiftUI

struct FavouritesView: View {
    @StateObject var viewModel: FavouritesViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.info ,id: \.id) { info in
                
                Text(info.name ?? "no name")
            }
        }
        .onAppear {
            viewModel.loadUI()
        }
    }
}

#Preview {
    FavouritesView(viewModel: FavouritesViewModel())
}
