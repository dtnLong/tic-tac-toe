//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var settings = AppSettings()
    
    var body: some View {
        Menu()
            .onAppear() {
                if let playerList = UserDefaults.standard.data(forKey: "playerList") {
                    do {
                        settings.playerList = try JSONDecoder().decode([Player].self, from: playerList)
                    } catch {
                        
                    }
                }
                
                if let currentPlayer = UserDefaults.standard.data(forKey: "currentPlayer") {
                    do {
                        settings.currentPlayer = try JSONDecoder().decode(Player.self, from: currentPlayer)
                    } catch {
                        
                    }
                }
            }
            .preferredColorScheme(settings.currentColorScheme)
            .environmentObject(settings)
    }
}
