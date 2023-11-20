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
                ListCharactersView(type: .characters).environmentObject(ListCharactersViewModel())
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Characters")
                    }
                ListCharactersView(type: .episodes).environmentObject(ListCharactersViewModel())
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Episodes")
                    }
                Text("Locations")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Characters")
                    }
            }
        }
    }
}
