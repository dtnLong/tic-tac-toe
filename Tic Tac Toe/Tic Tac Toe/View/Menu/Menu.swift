//
//  Menu.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct Menu: View {
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
                            } else {
                                settings.currentColorScheme = .light
                            }
                        }, label: {
                            Image(systemName: settings.colorSchemeSetting[settings.currentColorScheme]!.colorSchemeImageSetting)
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
                                Game(difficulty: difficulty)
                            } label: {
                                Text("RESUME")
                                    .modifier(MenuButtonTextModifier())
                            }
                            .modifier(MenuButtonModifier())
                        }

                        // MARK: PLAY BUTTON
                        NavigationLink {
                            Game(difficulty: difficulty)
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
                            Image("leaderboard" + settings.colorSchemeSetting[settings.currentColorScheme]!.colorSchemeImage)
                                .resizable()
                                .modifier(ActionButtonCircleModifier())
                        }
                    }
                    .padding([.trailing, .leading], 20)
                    .padding(.bottom, 10)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
