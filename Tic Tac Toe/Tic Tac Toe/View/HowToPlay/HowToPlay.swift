//
//  HowToPlay.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct HowToPlay: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var profile: ProfileData
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                // MARK: HOW TO PLAY TITLE
                Text("HOW TO PLAY")
                    .font(.system(size: 50, design: .rounded))
                    .foregroundColor(.primary)
                
                Spacer().frame(height: 40)
                
                // MARK: GAME IMAGE
                Image("tic-tac-toe" + settings.colorSchemeSetting[settings.currentColorScheme]!.colorSchemeImage)
                
                Spacer().frame(height: 40)
                
                // MARK: HOW TO PLAY LIST
                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .firstTextBaseline, spacing: 5) {
                        Text("1.")
                        Text("The game is played on a grid that's 3 squares by 3 squares.")
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 5) {
                        Text("2.")
                        Text("You are O, the computer is X. The player and the computer take turns putting their marks in empty squares.")
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 5) {
                        Text("3.")
                        Text("The first player to get 3 marks in a row (up, down, across, or diagonally) is the winner.")
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 5) {
                        Text("4.")
                        Text("When all 9 squares are full and no player has 3 marks in a row, the game is a draw.")
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 5) {
                        Text("5.")
                        Text("When you win, you get +1 point. When you lose, you get -1 point")
                    }
                }.padding([.trailing, .leading], 25)
                
                Spacer()
                
                HStack {
                    // MARK: BACK BUTTON
                    Image(systemName: "arrow.left")
                        .resizable()
                        .modifier(ActionButtonModifier(width: 35, height: 35))
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    
                    Spacer()
                }
                .padding([.trailing, .leading], 35)
                .padding(.bottom, 20)
            }
        }
        .navigationBarHidden(true)
    }
}
