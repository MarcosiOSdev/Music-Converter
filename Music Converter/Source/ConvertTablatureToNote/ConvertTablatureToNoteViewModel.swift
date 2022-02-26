//
//  ConvertTablatureToNoteViewModel.swift
//  Music Converter
//
//  Created by marcos.felipe.souza on 25/02/22.
//

import Foundation

import Combine

class ConvertTablatureToNoteViewModel: ObservableObject {
    
    // MARK: - Input Vars
    @Published
    var tablatureNoteSlider: Double = 0
    
    @Published
    var tablatureNoteText: String = "0"
    
    @Published
    var noteSelected = 0
    
    // MARK: - Output Vars
    @Published
    var tablatureNote: Int = 0
    
    @Published
    var convertedNote: String = ""
    
    var notes = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
    var maxPosition = 24
    
    
    private var cancellables = Set<AnyCancellable>()
    
    func onAppear() {
        $tablatureNoteSlider.combineLatest($noteSelected)
            .sink { [weak self] output in
                guard let self = self else { return }
                let tablature = output.0
                let note = self.notes[output.1]
                
                let postion = self.convertDoubleToInt(tablature)
                self.tablatureNote = postion
                self.tablatureNoteText = String(postion)
                self.convertedNote = self.convert(note: note, position: postion)
                
            }
            .store(in: &cancellables)
        
        $tablatureNoteText
            .compactMap { Int($0) }
            .filter { $0 > 0 && $0 <= self.maxPosition && $0 != self.convertDoubleToInt(self.tablatureNoteSlider) }
            .sink(receiveValue: { [weak self] output in
                self?.tablatureNoteSlider = Double(output)
            })
            .store(in: &cancellables)
    }
    
    private func convertDoubleToInt(_ doubleVal: Double) -> Int {
        let doubleString = String(format: "%.1f", doubleVal).split(separator: ".")[0]
        return Int(doubleString) ?? 0
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
