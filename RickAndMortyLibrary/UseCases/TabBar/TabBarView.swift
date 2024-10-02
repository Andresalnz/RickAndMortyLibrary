//
//  TabBarView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/12/23.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            ListHomeView(type: .characters, navigationTitle: Constants.titleCharacters).environmentObject(ListHomeViewModel(type: .characters))
                .tabItem {
                    Image(systemName: "person.fill")
                    Text(Constants.titleCharacters)
                }
            ListHomeView(type: .episodes, navigationTitle: Constants.titleEpisodes).environmentObject(ListHomeViewModel(type: .episodes))
                .tabItem {
                    Image(systemName: "book.fill")
                    Text(Constants.titleEpisodes)
                }
            ListHomeView(type: .locations, navigationTitle: Constants.titleLocations).environmentObject(ListHomeViewModel(type: .locations))
                .tabItem {
                    Image(systemName: "globe")
                    Text(Constants.titleLocations)
                }
            FavouritesView(viewModel: FavouritesViewModel(typeList: .locations))
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
