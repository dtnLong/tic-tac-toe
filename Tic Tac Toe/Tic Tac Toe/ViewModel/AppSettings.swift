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
    
    @Published var isActive = true

    private var observers = [NSObjectProtocol]()

    init() {
        observers.append(
            NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: .main) { _ in
                self.isActive = true
            }
        )
        observers.append(
            NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: .main) { _ in
                self.isActive = false
            }
        )
    }
    
    deinit {
        observers.forEach(NotificationCenter.default.removeObserver)
    }
}
