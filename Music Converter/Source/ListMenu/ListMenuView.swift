//
//  ListMenuView.swift
//  Music Converter
//
//  Created by marcos.felipe.souza on 26/02/22.
//

import SwiftUI

struct ListMenuView: View {
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                NavigationLink("Converter Tablatura para Nota", destination: ConvertTablatureToNoteView())
                
                Spacer()
            }
            .padding()
            .navigationTitle("Music Converter")
        }
    }
}
