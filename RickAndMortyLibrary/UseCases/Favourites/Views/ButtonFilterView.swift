//
//  ButtonFilterView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 1/2/24.
//

import SwiftUI

struct ButtonFilterView: View {
    
    let title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: { action() }, label: {
            Text(title)
            
                .font(.caption)
                .padding(7)
                .foregroundColor(.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 2)
                )
        })
    }
}

#Preview {
    ButtonFilterView(title: "Botón", action: { print("pulsado") })
}
