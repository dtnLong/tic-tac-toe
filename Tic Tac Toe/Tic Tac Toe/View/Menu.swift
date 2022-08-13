//
//  Menu.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct Menu: View {
    @EnvironmentObject var settings: AppSettings
    
    @State var isResume: Bool = false
    
    
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
                                Game()
                            } label: {
                                Text("RESUME")
                                    .modifier(MenuButtonTextModifier())
                            }
                            .modifier(MenuButtonModifier())
                        }

                        // Play Button
                        NavigationLink {
                            Game()
                        } label: {
                            Text("PLAY")
                                .modifier(MenuButtonTextModifier())
                        }
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
            .navigationBarHidden(true)
        }
    }
}
