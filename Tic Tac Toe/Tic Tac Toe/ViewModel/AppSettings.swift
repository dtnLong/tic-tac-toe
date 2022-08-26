//
//  AppSettings.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 13/08/2022.
//

import Foundation
import SwiftUI

class AppSettings: ObservableObject {
    @Published var currentColorScheme: UIUserInterfaceStyle = .unspecified
    @Published var colorSchemeSetting: [ColorScheme: ColorSchemeSetting] = [
        .light: ColorSchemeSetting(colorScheme: .light, colorSchemeImage: "-any"),
        .dark: ColorSchemeSetting(colorScheme: .dark, colorSchemeImage: "-dark")
    ]
    @Published var colorSchemeModeButton: [UIUserInterfaceStyle: String] = [
        .light: "sun.max",
        .dark: "cloud.moon",
        .unspecified: "desktopcomputer"
    ]
}
