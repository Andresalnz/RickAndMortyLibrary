//
//  InfoDetailCharacterRowView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 31/10/23.
//

import SwiftUI

struct InfoDetailCharacterRowView: View {
    
    let icon: String
    let label: Text
    let value: Text
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            label
            Spacer()
            value
        }
    }
}

#Preview {
    InfoDetailCharacterRowView(icon: "circle.fill", label: Text("Species"), value: Text("Alive"))
}
