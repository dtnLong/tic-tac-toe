//
//  Menu.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        
        
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        // Leaderboard Button
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
                        NavigationLink {
                            Game(player: Player(name: "Thomas", wins: 3))
                        } label: {
                            Text("RESUME")
                                .modifier(MenuButtonTextModifier())
                        }
                        .modifier(MenuButtonModifier())

                        // Play Button
                        NavigationLink {
                            Game(player: Player(name: "Thomas", wins: 3))
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
                            Image("leaderboard-any")
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
