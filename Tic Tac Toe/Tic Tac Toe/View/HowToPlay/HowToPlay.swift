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

struct HowToPlay: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
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
                Image("tic-tac-toe" + settings.colorSchemeSetting[colorScheme]!.colorSchemeImage)
                
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
                            dismiss()
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
