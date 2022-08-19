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

struct GameOverOverlay: View {
    @Binding var gameStatus: String
    var restartGame: () -> Void
    var endGame: () -> Void
    
    var body: some View {
        ZStack {
            Color("transparent")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                
                // MARK: DISPLAY GAME STATUS
                Text(gameStatus)
                    .font(.system(size: 55, design: .rounded))
                    .foregroundColor(.primary)
                
                Spacer()
                
                HStack {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .modifier(ActionButtonModifier(width: 35, height: 35))
                        .onTapGesture {
                            endGame()
                        }
                    
                    Spacer()
                    
                    Image(systemName: "arrow.2.circlepath")
                        .resizable()
                        .modifier(ActionButtonModifier())
                        .onTapGesture {
                            restartGame()
                        }
                }
                .padding([.trailing, .leading], 60)
                .padding(.bottom, 60)
            }
            .transition(.opacity.animation(.easeIn(duration: 0.4)))
            .frame(width: 290, height: 300, alignment: .center)
            .background(Color("primary-background"))
            .cornerRadius(20)
        }.onAppear() {
            if (gameStatus == "YOU WIN") {
                playSound(sound: "win", type: "wav", volumeScale: 1)
            } else if (gameStatus == "YOU LOSE") {
                playSound(sound: "lose", type: "wav", volumeScale: 2.5)
            } else {
                playSound(sound: "tie", type: "wav", volumeScale: 3)
            }
        }
    }
}
