//
//  Player.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import Foundation

enum PlayerType: Codable {
    case computer
    case account
    case guest
}

struct Player: Identifiable, Codable {
    var id = UUID()
    var name: String = ""
    var type: PlayerType = .guest
    var wins: Int = 0
}
