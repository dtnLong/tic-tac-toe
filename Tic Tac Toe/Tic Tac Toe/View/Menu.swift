//
//  Menu.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct Menu: View {
    @Binding var colorScheme: ColorScheme
    @State var colorSchemeImageSetting: String = "sun.max"
    @State var colorSchemeImage: String = "-any"
    
    
    @State var isResume: Bool = false
    @State var currentPlayerList: [Player] = [
        playerList[0],
        playerList[1]
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Button(action: {
                            if (colorScheme == .light) {
                                colorScheme = .dark
                                colorSchemeImageSetting = "cloud.moon"
                                colorSchemeImage = "-dark"
                            } else {
                                colorScheme = .light
                                colorSchemeImageSetting = "sun.max"
                                colorSchemeImage = "-any"
                            }
                        }, label: {
                            Image(systemName: colorSchemeImageSetting)
                                .resizable()
                                .foregroundColor(.primary)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40, alignment: .center)
                        })
                        // Profile
                        Spacer()

                        NavigationLink {
                            Profile()
                        } label: {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .foregroundColor(.primary)
                                .frame(width: 40, height: 40, alignment: .center)
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
                                Game(player: $currentPlayerList[0])
                            } label: {
                                Text("RESUME")
                                    .modifier(MenuButtonTextModifier())
                            }
                            .modifier(MenuButtonModifier())
                        }

                        // Play Button
                        NavigationLink {
                            Game(player: $currentPlayerList[0])
                        } label: {
                            Text("PLAY")
                                .modifier(MenuButtonTextModifier())
                        }
                        .modifier(MenuButtonModifier())

                        // How to play Button
                        NavigationLink {
                            HowToPlay(colorSchemeImage: $colorSchemeImage)
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
                            Leaderboard(currentPlayerList: $currentPlayerList)
                        } label: {
                            Image("leaderboard" + colorSchemeImage)
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
