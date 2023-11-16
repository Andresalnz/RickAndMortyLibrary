//
//  SectionImageView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 1/11/23.
//

import SwiftUI

struct SectionImageView<T>: View where T: DetailView {
    
    let model: T
    
    var body: some View {
        if let image = model.image {
                AsyncImageView(urlImage: image)
                    .scaledToFill()
                    .listRowBackground(RoundedRectangle(cornerRadius: Constants.sizeCornerRadius)
                        .background(.clear)
                        .foregroundColor(.clear)
                        .padding(.vertical)
                    )
                    .shadow(radius: Constants.sizeCornerRadius)
            } else {
                Image(systemName: "person.fill")
            }
    }
}

#Preview {
    SectionImageView(model: Detail(image: URL(string: "")))
}
