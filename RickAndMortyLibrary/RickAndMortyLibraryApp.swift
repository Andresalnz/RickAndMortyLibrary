//
//  RickAndMortyLibraryApp.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import SwiftUI

@main
struct RickAndMortyLibraryApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ListHomeView(type: .characters, navigationTitle: Constants.titleCharacters).environmentObject(ListHomeViewModel())
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text(Constants.characters)
                    }
                ListHomeView(type: .episodes, navigationTitle: Constants.titleEpisodes).environmentObject(ListHomeViewModel())
                    .tabItem {
                        Image(systemName: "book.fill")
                        Text(Constants.episodes)
                    }
                ListHomeView(type: .locations, navigationTitle: Constants.titleLocations).environmentObject(ListHomeViewModel())
                    .tabItem {
                        Image(systemName: "globe")
                        Text(Constants.locations)
                    }
            }
        }
    }
}
