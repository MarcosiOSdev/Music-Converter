//
//  ContentView.swift
//  Music Converter
//
//  Created by marcos.felipe.souza on 25/02/22.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    
    
    
    // MARK: - Input Vars
    @Published
    var tablatureNoteSlider: Double = 0
    
    @Published
    var noteSelected = 0
    
    // MARK: - Output Vars
    @Published
    var tablatureNote: Int = 0
    
    @Published
    var convertedNote: String = ""
    
    var notes = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
    
    
    
    private var cancellables = Set<AnyCancellable>()
    
    func onAppear() {
        $tablatureNoteSlider.combineLatest($noteSelected)
            .sink { [weak self] output in
                guard let self = self else { return }
                let tablature = output.0
                let note = self.notes[output.1]
                
                let postion = Int(round(tablature))
                self.tablatureNote = postion
                self.convertedNote = self.convert(note: note, position: postion)
                
            }
            .store(in: &cancellables)
    }    
    
    private func convert(
        note: String,
        position: Int
    ) -> String {
        
        if let index = notes.firstIndex(of: note) {
            let sumNotes = index + position
            
            if sumNotes < notes.count {
                return notes[sumNotes]
            } else {
                
                let resto = sumNotes % notes.count
                if resto < notes.count {
                    return notes[resto]
                }
            }
        }
        return ""
    }
}


struct ContentView: View {
        
    @ObservedObject
    private var viewModel: ViewModel = ViewModel()
        
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
                    Text("Na posição: \(viewModel.tablatureNote)")
                }
                
                Text("Nota na escala é: \(viewModel.convertedNote)")
            }
            .onAppear(perform: viewModel.onAppear)
            .navigationBarTitle("Conversor Tablatura p/ Notas")

        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
