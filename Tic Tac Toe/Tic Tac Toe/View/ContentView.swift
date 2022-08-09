//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State var player: Player = Player()
    
    var body: some View {
        ZStack {
            VStack {
                // Game Image
                Spacer()
                
                VStack(spacing: 15) {
                    // Resume Button
                    Button(action: {
                        
                    }, label: {
                        Text("RESUME")
                            .modifier(MenuButtonTextModifier())
                    })
                        .modifier(MenuButtonModifier())
                    
                    // Play Button
                    Button(action: {
                        
                    }, label: {
                        Text("PLAY")
                            .modifier(MenuButtonTextModifier())
                    })
                        .modifier(MenuButtonModifier())
                    
                    // How to play Button
                    Button(action: {
                        
                    }, label: {
                        Text("HOW TO PLAY")
                            .modifier(MenuButtonTextModifier())
                    })
                        .modifier(MenuButtonModifier())
                }
                
                Spacer()
                
                HStack {
                    Button(action: {
    
                    }, label: {
                        Spacer()
                        
                        Image("leaderboard")
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                            .padding(15)
                            .overlay(Circle().stroke(Color(.black),lineWidth: 3))
                    })
                }
                .padding([.trailing, .leading], 20)
            }
        }
    }
}
