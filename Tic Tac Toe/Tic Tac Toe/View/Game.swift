//
//  Game.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct Game: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var playerList: [Match] = []
    @State var currentPlayer: Int = 0
    @State var currentTurn: Int = 1
    @State var gameStatus: String = ""
    @State var moves: [String] = Array(repeating: "", count: 9)
    
    let columns: [GridItem] = Array(repeating: GridItem(.fixed(100), spacing: 0, alignment: .center), count: 3)
    
    init(player: Player) {
        _playerList = State(initialValue: [
            Match(player: player, isMove: false, piece: "circle", color: "primary"),
            Match(player: Player(name: "Computer", wins: 0), isMove: false, piece: "xmark", color: "gray")
        ])
    }
    
    func checkWin(move: Int) -> Bool {
        // Check row
        let rowStartIndex: Int = move - (move % 3)
        if (moves[rowStartIndex] == moves[rowStartIndex + 1] && moves[rowStartIndex] == moves[rowStartIndex + 2]) {
            return true
        }
        
        // Check column
        let columnStartIndex: Int = move % 3
        if (moves[columnStartIndex] == moves[columnStartIndex + 3] && moves[columnStartIndex] == moves[columnStartIndex + 6]) {
            return true
        }
        
        // Check left to right diagonal
        if (move == 0 || move == 4 || move == 8) {
            if (moves[0] == moves[4] && moves[0] == moves[8]) {
                return true
            }
        }
        
        // Check right to left diagonal
        if (move == 2 || move == 4 || move == 6) {
            if (moves[2] == moves[4] && moves[2] == moves[6]) {
                return true
            }
        }
        
        return false
    }
    
    func endTurn(move: Int) -> Void {
        if checkWin(move: move) {
            if (playerList[currentPlayer].player.name == "Computer") {
                gameStatus = "YOU LOSE"
            } else {
                gameStatus = "YOU WIN"
            }
            return
        }
        
        // Check tie
        if currentTurn == 9 {
            gameStatus = "DRAW"
            return
        }
        
        currentTurn += 1
        playerList[currentPlayer].color = "gray"
        if (currentPlayer != playerList.count - 1) {
            currentPlayer += 1
        } else {
            currentPlayer = 0
        }
        playerList[currentPlayer].color = "primary"
        playerList[currentPlayer].isMove = false;
    }
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                // Turn
                HStack {
                    Spacer()
                    Image(systemName: "person")
                        .resizable()
                        .modifier(TurnDisplayModifier(color: $playerList[0].color))
                    Spacer()
                    Image(systemName: "desktopcomputer")
                        .resizable()
                        .modifier(TurnDisplayModifier(color: $playerList[1].color))
                    Spacer()
                }
                
                Spacer().frame(height: 60)
                
                // Board
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(0..<9, id: \.self) {index in
                        Rectangle()
                            .foregroundColor(.clear)
                            .border(Color.black)
                            .frame(width: 100, height: 100)
                            .overlay(
                                Image(systemName: moves[index])
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .onTapGesture {
                                        if (moves[index] == "" && !playerList[currentPlayer].isMove) {
                                            playerList[currentPlayer].isMove = true
                                            moves[index] = playerList[currentPlayer].piece
                                            endTurn(move: index)
                                        }
                                    }
                            )
                    }
                }
                
                Spacer()
                
                // Action button
                HStack {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: .center)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                    Image(systemName: "arrow.2.circlepath")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: .center)
                }
                .padding([.trailing, .leading], 35)
                .padding(.bottom, 20)
                
            }
            
            // Game over
            if (gameStatus != "") {
                ZStack {
                    Color("transparent")
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Spacer()
                        
                        Text(gameStatus)
                            .font(.system(size: 55, design: .rounded))
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40, alignment: .center)
                                .onTapGesture {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            
                            Spacer()
                            
                            Image(systemName: "arrow.2.circlepath")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40, alignment: .center)
                        }
                        .padding([.trailing, .leading], 35)
                        .padding(.bottom, 20)
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
                    .background(Color("primary-background"))
                    .cornerRadius(20)
                }
            }
        }.navigationBarHidden(true)
    }
}
