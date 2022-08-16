//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var settings = AppSettings()
    @StateObject var profile = ProfileData()
    
    var body: some View {
        Menu()
            .onAppear() {
                if let data = UserDefaults.standard.data(forKey: "player") {
                    do {
                        profile.player = try JSONDecoder().decode(Player.self, from: data)
                    } catch {
                        
                    }
                }
                
                if let data = UserDefaults.standard.data(forKey: "playerList") {
                    do {
                        profile.playerList = try JSONDecoder().decode([Player].self, from: data)
                    } catch {
                        
                    }
                }
            }
            .preferredColorScheme(settings.currentColorScheme)
            .environmentObject(settings)
            .environmentObject(profile)
    }
}
