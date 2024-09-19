//
//  InfoDetailCharacterRowView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 31/10/23.
//

import SwiftUI

struct InfoDetailCharacterRowView: View {
    
    let icon: String?
    let label: String?
    let value: Text
    
    var body: some View {
        HStack {
            if let icon = icon {
                Image(systemName: icon)
            }
            Text(label ?? Constants.noText)
            Spacer()
            value
        }
    }
}

#Preview {
    InfoDetailCharacterRowView(icon: "circle.fill", label: "Species", value: Text("Alive"))
}
