//
//  ContentView.swift
//  Music Converter
//
//  Created by marcos.felipe.souza on 25/02/22.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    
    var notes = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
    
    @Published
    var tablatureNoteSlider: Double = 0
    
    @Published
    var noteInput = ""
    
    @Published
    var tablatureNote: Int = 0
    
    @Published
    var convertedNote: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    func onAppear() {
        $tablatureNoteSlider.combineLatest($noteInput)
            .filter({
                self.notes.contains($0.1)
            })
            .sink { [weak self] output in
                guard let self = self else { return }
                let tablature = output.0
                let note = output.1
                
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
        
        VStack(alignment: .leading, spacing: 8) {
            TextField("Nota:", text: $viewModel.noteInput)
            
            VStack(alignment: .center) {
                Slider(value: $viewModel.tablatureNoteSlider, in: 0...24)
                Text("Na posição: \(viewModel.tablatureNote)")
            }
            
            Text("Nota na escala é: \(viewModel.convertedNote)")
        }.onAppear(perform: viewModel.onAppear)
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
