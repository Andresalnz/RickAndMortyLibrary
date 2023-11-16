//
//  CharacterRowView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import SwiftUI

protocol RowList {
    var image: URL? { get }
    var name: String? { get }
    var species: Species? { get }
}

struct CharacterRowView<T>: View  where T: RowList {
    
    let type: T
    
    var body: some View {
        HStack {
            if let image = type.image {
                AsyncImageView(urlImage: image)
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0), style: FillStyle())
            } else {
                Image(systemName: "person.fill")
            }
            VStack(alignment: .leading) {
                Text(type.name ?? Constants.noText)
                    .font(.title3)
                Text(type.species?.rawValue ?? Constants.noText)
            }
        }
    }
}

#Preview {
    CharacterRowView(type: RowListAndDetail(image: URL(string: ""), name: "Rick", species: .Animal))
}
