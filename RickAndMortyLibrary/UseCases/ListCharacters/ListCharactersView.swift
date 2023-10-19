//
//  ListCharactersView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import SwiftUI

struct ListCharactersView: View {
    
    //MARK: - ViewModel
    @EnvironmentObject var viewModel: ListCharactersViewModel
    
    //MARK: - Grid
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, content: {
                ForEach(viewModel.characters, id: \.id) { character in
                    NavigationView {
                        NavigationLink(destination: Text("Destination")) {
                            if let image = character.image {
                                AppImage(url: image)
                            }
                        }
                    }
                }
            })
           
        }
        .onAppear {
            viewModel.loadUI()
        }
    }
}

#Preview {
    ListCharactersView().environmentObject(ListCharactersViewModel())
}
