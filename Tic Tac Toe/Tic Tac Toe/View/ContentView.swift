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
                if let playerList: [Player] = StorageUtil.getData(key: "playerList") {
                    profile.playerList = playerList
                }

                if let player: Player = StorageUtil.getData(key: "player") {
                    profile.player = player
                }
            }
            .preferredColorScheme(settings.currentColorScheme)
            .environmentObject(settings)
            .environmentObject(profile)
    }
}
