//
//  ListMenuView.swift
//  Music Converter
//
//  Created by marcos.felipe.souza on 26/02/22.
//

import SwiftUI

struct ListMenuView: View {
    
    var viewModel: ListMenuViewModel
    
    var body: some View {
        List(viewModel.items) { item in
            Text(item.description)
                .onTapGesture {
                    viewModel.open(item)
                }                
        }
        .padding()
        .navigationTitle("Music Converter")
    }
}
