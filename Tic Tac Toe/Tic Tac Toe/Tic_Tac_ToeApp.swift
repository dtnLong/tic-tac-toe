/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Dang Truong Nguyen Long
  ID: s3757333
  Created  date: 19/08/2022
  Last modified: 19/08/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

@main
struct Tic_Tac_ToeApp: App {
    @StateObject var settings = AppSettings()
    @StateObject var profile = ProfileData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear()
                .onAppear() {
                    // Retrieve current player and list of player from storage on startup
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
}
