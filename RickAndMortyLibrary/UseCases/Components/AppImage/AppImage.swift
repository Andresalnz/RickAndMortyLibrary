//
//  AppImage.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 19/10/23.
//

import SwiftUI

struct AppImage: View {
    let url: URL
    @State var image: UIImage? = nil
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            } else {
                Color.gray
            }
        }
        .onAppear {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data {
                    DispatchQueue.main.async {
                        image = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }
}

#Preview {
    AppImage(url: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!)
}
