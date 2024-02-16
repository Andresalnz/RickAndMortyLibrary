//
//  SwipeActionsViewModifier.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 16/2/24.
//

import SwiftUI

struct SwipeActionsViewModifier: ViewModifier {
    
    let action: () -> Void
    let label: Label<Text, Image>
    
    func body(content: Content) -> some View {
        content
            .swipeActions(edge: .trailing) {
                Button {
                    action()
                } label: {
                    label
                }

            }
    }
}
