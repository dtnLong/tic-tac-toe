//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State var colorScheme: ColorScheme = .light
    
    var body: some View {
        Menu(colorScheme: $colorScheme).preferredColorScheme(colorScheme)
    }
}
