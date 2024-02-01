//
//  CharacterFavouriteView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 1/2/24.
//

import SwiftUI

struct CharacterFavouriteView: View {
    
    let model: RowDetail
    
    var body: some View {
        HStack(spacing: 30) {
            if let image = model.image {
                AsyncImageView(urlImage: image)
                    .scaledToFit()
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0), style: FillStyle())
            }
            VStack(alignment: .leading, spacing: 15) {
                Text(model.name ?? "")
                Text(model.species?.rawValue ?? "")
                Text(model.status?.rawValue ?? "")
                Text(model.location?.name ?? "")
            }
        }
    }
}

#Preview {
    CharacterFavouriteView(model: RowDetail())
}
