//
//  SwiftUIView.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 19/08/2022.
//

import SwiftUI

struct GameOverOverlay: View {
    @Binding var gameStatus: String
    var restartGame: () -> Void
    var endGame: DismissAction
    
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
            .frame(width: 280, height: 300, alignment: .center)
            .background(Color("primary-background"))
            .cornerRadius(20)
        }
    }
}
