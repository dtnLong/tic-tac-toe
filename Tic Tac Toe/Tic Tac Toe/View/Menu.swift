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
    
    @Environment(\.scenePhase) var scenePhase
    
    @State var isResume: Bool = false
    @State var difficulty: String = "easy"
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Button(action: {
                            if (settings.currentColorScheme == .light) {
                                settings.currentColorScheme = .dark
                            } else {
                                settings.currentColorScheme = .light
                            }
                        }, label: {
                            Image(systemName: settings.colorSchemeSetting[settings.currentColorScheme]!.colorSchemeImageSetting)
                                .resizable()
                                .foregroundColor(.primary)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50, alignment: .center)
                        })
                        // Profile
                        Spacer()

                        NavigationLink {
                            Profile()
                        } label: {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .foregroundColor(.primary)
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                    }
                    .padding([.trailing, .leading], 20)
                    // Game Title
                    
                    Spacer()
                    
                    Text("TIC-TAC-TOE")
                        .font(.system(size: 55, design: .rounded))
                        .foregroundColor(.primary)

                    Spacer().frame(height: 50)

                    VStack(spacing: 15) {

                        // Resume Button
                        if (isResume) {
                            NavigationLink {
                                Game(difficulty: difficulty)
                            } label: {
                                Text("RESUME")
                                    .modifier(MenuButtonTextModifier())
                            }
                            .modifier(MenuButtonModifier())
                        }

                        // Play Button
                        NavigationLink {
                            Game(difficulty: difficulty)
                        } label: {
                            Text("PLAY")
                                .modifier(MenuButtonTextModifier())
                        }
                        .modifier(MenuButtonModifier())
                        
                        // Dificulty
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

                        // How to play Button
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
                        // Leaderboard Button
                        Spacer()

                        NavigationLink {
                            Leaderboard()
                        } label: {
                            Image("leaderboard" + settings.colorSchemeSetting[settings.currentColorScheme]!.colorSchemeImage)
                                .resizable()
                                .frame(width: 35, height: 35, alignment: .center)
                                .padding(15)
                                .overlay(Circle().stroke(Color("primary"), lineWidth: 3))
                        }
                    }
                    .padding([.trailing, .leading], 20)
                }
            }
            .onChange(of: scenePhase, perform: { phase in
                if phase == .background {
                    do {
                        UserDefaults.standard.set(try JSONEncoder().encode(profile.player), forKey: "player")
                        UserDefaults.standard.set(try JSONEncoder().encode(profile.playerList), forKey: "playerList")
                    } catch {

                    }
                }
            })
            .navigationBarHidden(true)
        }
    }
}
