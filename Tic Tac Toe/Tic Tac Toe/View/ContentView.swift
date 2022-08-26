/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Dang Truong Nguyen Long
  ID: s3757333
  Created  date: 19/08/2022
  Last modified: 19/08/2022
  Acknowledgement: Mixkit, pixabay, Flaticon
*/

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var profile: ProfileData
    @EnvironmentObject var matchData: MatchData
    
    var body: some View {
        Menu()
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                // Save data when app go to background
                do {
                    UserDefaults.standard.set(try JSONEncoder().encode(profile.player), forKey: "player")
                    UserDefaults.standard.set(try JSONEncoder().encode(profile.playerList), forKey: "playerList")
                } catch {

                }
            })
    }
}
