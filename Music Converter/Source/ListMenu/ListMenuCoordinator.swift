//
//  ListMenuCoordinator.swift
//  Music Converter
//
//  Created by marcos.felipe.souza on 22/03/22.
//

import SwiftUI

class ListMenuCoordinator: ObservableObject {
    
    var listViewModel: ListMenuViewModel!
    
    @Published
    var convertTablatureToNoteCoordinator: ConvertTablatureToNoteCoordinator?
    
    init() {
        self.listViewModel = ListMenuViewModel(coordinator: self)
    }
    
    func open(menuItem: MenuItem) {
        convertTablatureToNoteCoordinator = ConvertTablatureToNoteCoordinator()
    }
    
}

struct ListMenuCoordinatorView: View {
    
    @ObservedObject var coordinator: ListMenuCoordinator
    var body: some View {
        NavigationView {
            ListMenuView(viewModel: coordinator.listViewModel)
                .navigation(item: $coordinator.convertTablatureToNoteCoordinator) { coordinator in
                    ConvertTablatureToNoteCoordinatorView(coordinator: coordinator)
                }
        }
    }
}
