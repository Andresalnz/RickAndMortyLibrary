//
//  ListWithSeparation.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 30/11/23.
//

import SwiftUI

struct ListWithSeparation<T>: View where T: Detail {
    
    let model: T
    
    var body: some View {
        VStack {
            Text(model.name ?? " no name")
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                if let airDate = model.airDate {
                    Text(airDate)
                }
                
                Spacer()
                if let episode = model.episode {
                    Text(episode)
                }
               
            }
        }
        .padding(.bottom, 10)
        
        .listRowSeparator(.hidden)
        .listRowBackground(RoundedRectangle(cornerRadius: Constants.sizeCornerRadius)
            .background(.clear)
            .foregroundStyle(.white)
            .opacity(0.8)
            .padding(.bottom, 10)
        )
    }
}
//
//#Preview {
//    ListWithSeparation(content: Text(""))
//}
