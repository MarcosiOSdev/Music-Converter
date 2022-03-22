//
//  MenuItem.swift
//  Music Converter
//
//  Created by marcos.felipe.souza on 22/03/22.
//

import Foundation

enum MenuItem: CaseIterable, Identifiable {
    
    case convertTablatureToNote
    
    var id: String {
        self.description
    }
    
    var description: String {
        switch self {
        case .convertTablatureToNote: return "Converter Tablatura para Nota"
        }
    }
}
