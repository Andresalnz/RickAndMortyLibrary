//
//  CustomListView.swift
//  RickAndMortyLibrary
//
//  Created by Andres Aleu on 13/11/23.
//

import SwiftUI

struct SectionDetailView<Content: View>: View {
    
    let content: Content
    let titleSection: String
    
    init(content: () -> Content , titleSection: String) {
        self.content = content()
        self.titleSection = titleSection
    }
    
    var body: some View {
        Section(titleSection) {
            content
        }
    }
}
//
//#Preview {
//    CustomListView(content: Text(""), titleSection: "")
//}
