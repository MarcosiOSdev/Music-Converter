//
//  ListMenuViewModel.swift
//  Music Converter
//
//  Created by marcos.felipe.souza on 22/03/22.
//

import Combine

class ListMenuViewModel: ObservableObject {
    
    let items: [MenuItem] = MenuItem.allCases
    
    unowned var coordinator: ListMenuCoordinator
    
    init(coordinator: ListMenuCoordinator) {
        self.coordinator = coordinator
    }
    
    func open(_ item: MenuItem) {
        coordinator.open(menuItem: item)
    }
}
