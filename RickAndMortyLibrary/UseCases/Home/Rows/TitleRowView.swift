//
//  TitleRowView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 20/11/23.
//

import SwiftUI

struct TitleRowView<T>: View where T: HomeRowView {
    
    let type: T
    var body: some View {
        Text(type.name ?? "")
    }
}

#Preview {
    TitleRowView(type: RowListMain(name: ""))
}
