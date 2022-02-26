//
//  View+Extension.swift
//  Music Converter
//
//  Created by marcos.felipe.souza on 26/02/22.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
