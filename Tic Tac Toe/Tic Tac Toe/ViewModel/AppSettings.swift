//
//  AppSettings.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 13/08/2022.
//

import Foundation
import SwiftUI

class AppSettings: ObservableObject {
    @Published var currentColorScheme: ColorScheme = .light
    @Published var colorSchemeSetting: [ColorScheme: ColorSchemeSetting] = [
        .light: ColorSchemeSetting(colorScheme: .light, colorSchemeImage: "-any", colorSchemeImageSetting: "sun.max"),
        .dark: ColorSchemeSetting(colorScheme: .dark, colorSchemeImage: "-dark", colorSchemeImageSetting: "cloud.moon")
    ]
    @Published var currentPlayer: Player = Player(name: "Guest")
    @Published var playerList: [Player] = []
}
