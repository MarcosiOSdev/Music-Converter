//
//  ContentView.swift
//  Music Converter
//
//  Created by marcos.felipe.souza on 25/02/22.
//

import SwiftUI

struct ConvertTablatureToNoteView: View {
        
    @ObservedObject
    private var viewModel = ConvertTablatureToNoteViewModel()
        
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker(selection: $viewModel.noteSelected) {
                        ForEach(0 ..< viewModel.notes.count) {
                            Text(viewModel.notes[$0])
                        }
                    } label: {
                        Text("Nota")
                    }
                }
                
                Section {
                    Slider(value: $viewModel.tablatureNoteSlider, in: 0...24)
                    HStack {
                        Text("Na posição: ")
                        TextField("\(viewModel.tablatureNote)", text: $viewModel.tablatureNoteText)
                            .keyboardType(.numberPad)
                    }
                    
                }
                
                Text("Nota na escala é: \(viewModel.convertedNote)")
            }
            .onAppear(perform: viewModel.onAppear)
            .navigationBarTitle("Conversor Tablatura p/ Notas")
        }
    }
}
