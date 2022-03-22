//
//  File.swift
//  Music Converter
//
//  Created by marcos.felipe.souza on 22/03/22.
//

import SwiftUI

class ConvertTablatureToNoteCoordinator: ObservableObject {
    var viewModel: ConvertTablatureToNoteViewModel
    init(viewModel: ConvertTablatureToNoteViewModel = ConvertTablatureToNoteViewModel() ) {
        self.viewModel = viewModel
    }
}

struct ConvertTablatureToNoteCoordinatorView: View {
    
    var coordinator: ConvertTablatureToNoteCoordinator
    
    var body: some View {
        ConvertTablatureToNoteView(viewModel: coordinator.viewModel)
    }
}
