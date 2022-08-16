//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var profile: ProfileData
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Menu()
            .onChange(of: scenePhase, perform: { phase in
                if phase == .background {
                    do {
                        UserDefaults.standard.set(try JSONEncoder().encode(profile.player), forKey: "player")
                        UserDefaults.standard.set(try JSONEncoder().encode(profile.playerList), forKey: "playerList")
                    } catch {

                    }
                }
            })
    }
}
