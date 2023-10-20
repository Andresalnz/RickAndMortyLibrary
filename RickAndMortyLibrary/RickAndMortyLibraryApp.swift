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
            ListCharactersView().environmentObject(ListCharactersViewModel())
        }
    }
}
