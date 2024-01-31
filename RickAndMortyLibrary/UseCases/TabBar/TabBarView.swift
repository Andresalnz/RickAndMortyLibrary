//
//  TabBarView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/12/23.
//

import SwiftUI

struct TabBarView: View {
    
    @StateObject var viewModel: ListHomeViewModel = ListHomeViewModel()
    
    var body: some View {
        TabView {
            ListHomeView(type: .characters, navigationTitle: Constants.titleCharacters).environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text(Constants.titleCharacters)
                }
            ListHomeView(type: .episodes, navigationTitle: Constants.titleEpisodes).environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "book.fill")
                    Text(Constants.titleEpisodes)
                }
            ListHomeView(type: .locations, navigationTitle: Constants.titleLocations).environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "globe")
                    Text(Constants.titleLocations)
                }
            FavouritesView(viewModel: FavouritesViewModel())
                .tabItem {
                    Image(systemName: "heart")
                    Text(Constants.titleFavourite)
                }
        }
    }
}

#Preview {
    TabBarView()
}
