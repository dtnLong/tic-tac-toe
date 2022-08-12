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
    @State var moves: [String] = Array(repeating: "", count: 9)
    
    let columns: [GridItem] = Array(repeating: GridItem(.fixed(100), spacing: 0, alignment: .center), count: 3)
    
    init(player: Player) {
        _playerList = State(initialValue: [
            Match(player: player, isMove: false, piece: "circle"),
            Match(player: Player(name: "Computer", wins: 0), isMove: false, piece: "xmark")
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
            print(playerList[currentPlayer].player.name)
            return
        }
        
        // Check tie
        if currentTurn == 9 {
            print("Tie")
            return
        }
        
        currentTurn += 1
        if (currentPlayer != playerList.count - 1) {
            currentPlayer += 1
        } else {
            currentPlayer = 0
        }
        playerList[currentPlayer].isMove = false;
    }
    
    var body: some View {
        ZStack {
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
        }.navigationBarBackButtonHidden(false)
    }
}
