//
//  Constants.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/10/23.
//

import Foundation

//MARK: - Constants
struct Constants {
    //URL'S
    static let uri: String = "https://rickandmortyapi.com/api"
    static let characters: String = "/character"
    static let locations: String = "/location"
    static let episodes: String = "/episode"
    static let page: String = "/?page="
    
    //Texts
    static let titleCharacters: String = "Characters"
    static let titleEpisodes: String = "Episodes"
    static let titleLocations: String = "Locations"
    static let titleResidents: String = "Residents"
    static let titleFavourite: String = "Favourites"
    static let titleImage: String = "Image"
    static let titleInformation: String = "Information"
    static let noText: String = "N/A"
    static let searchPrompt: String = "Search..."
    static let messageAlertError: String = "Error en la App, intentelo mas tarde"
    
    //Constants UI
    static let sizeCornerRadius: CGFloat = 8
}
