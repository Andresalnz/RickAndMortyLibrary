//
//  CharacterFavouriteView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 1/2/24.
//

import SwiftUI

struct CharacterFavouriteView: View {
    
    let model: FirebaseFirestoreCharacterModel
    
    var body: some View {
        HStack(spacing: 30) {
            if let image = model.image {
                AsyncImage(url: image) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0), style: FillStyle())
                }
                placeholder: {
                    ProgressView()
                }
            }
            VStack(alignment: .leading, spacing: 15) {
                Text(model.name ?? "")
                Text(model.species ?? "")
                Text(model.status ?? "")
                Text(model.name ?? "")
            }
        }
    }
}

#Preview {
    CharacterFavouriteView(model: FirebaseFirestoreCharacterModel())
}
