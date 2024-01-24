//
//  StyleList.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 24/1/24.
//

import SwiftUI

struct StyleList: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.bottom, 10)
            .listRowSeparator(.hidden)
            .listRowBackground(RoundedRectangle(cornerRadius: Constants.sizeCornerRadius)
                .background(.clear)
                .foregroundStyle(.white
                                )
                .opacity(0.8)
                .padding(.bottom, 10)
            )
    }
}
