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

struct Menu: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var profile: ProfileData
    @EnvironmentObject var matchData: MatchData
    
    @State var difficulty: String = "easy"
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        // MARK: DARK MODE BUTTON
                        Button(action: {
                            if (settings.currentColorScheme == .light) {
                                settings.currentColorScheme = .dark
                            } else if (settings.currentColorScheme == .dark) {
                                settings.currentColorScheme = .unspecified
                            } else {
                                settings.currentColorScheme = .light
                            }
                            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = settings.currentColorScheme
                        }, label: {
                            Image(systemName: settings.colorSchemeModeButton[settings.currentColorScheme]!)
                                .resizable()
                                .modifier(ActionButtonModifier())
                        })
                        
                        Spacer()

                        // MARK: PROFILE BUTTON
                        NavigationLink {
                            Profile()
                        } label: {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .modifier(ActionButtonModifier())
                        }
                    }
                    .padding([.trailing, .leading], 20)
                    
                    Spacer()
                    
                    // MARK: GAME TITLE
                    Text("TIC-TAC-TOE")
                        .font(.system(size: 55, design: .rounded))
                        .foregroundColor(.primary)

                    Spacer().frame(height: 50)

                    VStack(spacing: 15) {

                        // MARK: RESUME GAME BUTTON
                        if (matchData.isResume) {
                            NavigationLink {
                                Game(difficulty: difficulty, isResume: true)
                            } label: {
                                Text("RESUME")
                                    .modifier(MenuButtonTextModifier())
                            }
                            .modifier(MenuButtonModifier())
                        }

                        // MARK: PLAY BUTTON
                        NavigationLink {
                            Game(difficulty: difficulty, isResume: false)
                        } label: {
                            Text("PLAY")
                                .modifier(MenuButtonTextModifier())
                        }
                        .modifier(MenuButtonModifier())
                        
                        // MARK: DIFFICULTY BUTTON
                        Button(action: {
                            if (difficulty == "easy") {
                                difficulty = "normal"
                            } else if (difficulty == "normal") {
                                difficulty = "insane"
                            } else {
                                difficulty = "easy"
                            }
                        }, label: {
                            Text("DIFFICULTY: " + difficulty.uppercased())
                                .modifier(MenuButtonTextModifier())
                        })
                        .modifier(MenuButtonModifier())

                        // MARK: HOW TO PLAY BUTTON
                        NavigationLink {
                            HowToPlay()
                        } label: {
                            Text("HOW TO PLAY")
                                .modifier(MenuButtonTextModifier())
                        }
                        .modifier(MenuButtonModifier())

                    }

                    Spacer()

                    HStack {
                        Spacer()
                        
                        // MARK: LEADERBOARD BUTTON
                        NavigationLink {
                            Leaderboard()
                        } label: {
                            Image("leaderboard" + settings.colorSchemeSetting[colorScheme]!.colorSchemeImage)
                                .resizable()
                                .modifier(ActionButtonCircleModifier())
                        }
                    }
                    .padding([.trailing, .leading], 20)
                    .padding(.bottom, 10)
                }
            }
            .onAppear() {
                if let audioPlayer = menuMusicPlayer {
                    if (!audioPlayer.isPlaying) {
                        playSoundLoop(sound: "menu-background", type: "mp3", volumeScale: 1, loop: -1, audioPlayer: &menuMusicPlayer)
                    }
                } else {
                    playSoundLoop(sound: "menu-background", type: "mp3", volumeScale: 1, loop: -1, audioPlayer: &menuMusicPlayer)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
