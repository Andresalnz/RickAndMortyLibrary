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
    static let status: String = "Status"
    static let species: String = "Species"
    static let type: String = "Type"
    static let gender: String = "Gender"
    static let origin: String = "Origin"
    static let location: String = "Location"
    static let dimension: String = "Dimension"
    static let airDate: String = "Air Date"
    static let episode: String = "Episode"
    static let titleImage: String = "Image"
    static let titleInformation: String = "Information"
    static let noText: String = "N/A"
    static let searchPrompt: String = "Search..."
    static let messageAlertError: String = "Error en la App, intentelo mas tarde"
    
    

    
    //Constants UI
    static let sizeCornerRadius: CGFloat = 8
    
    //FirebaseFirestore
    static let collectionCharacter: String = "charactersFavs"
    static let collectionEpisodes: String = "episodesFavs"
    static let collectionLocations: String = "locationsFavs"
    
    //Icons
    enum Icons: String {
        case circleFill = "circle.fill"
        case personCircle = "person.circle"
        case personFill = "person.fill"
        case globeAsiaAustraliaFill = "globe.asia.australia.fill"
        case locationFill = "location.fill"
        case mountain2CircleFill = "mountain.2.circle.fill"
        case tvCircle = "tv.circle"
        case ellipsisBubbleFill = "ellipsis.bubble.fill"
    }
}
