//
//  Match.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 12/08/2022.
//

import Foundation

struct PlayerProp: Codable {
    var isMove: Bool = false
    var piece: String
    var turnColor: String
}

struct Match: Codable {
    var moves: [String] = Array(repeating: "", count: 9)
    var currentTurn: Int = 1
    var currentPlayer: String = "player"
    var gameStatus: String = ""
    var difficulty: String = "easy"
    var playerData: [String: PlayerProp] = [
        "player": PlayerProp(isMove: false, piece: "circle", turnColor: "primary"),
        "computer": PlayerProp(isMove: false, piece: "xmark", turnColor: "gray")
    ]
}
