//
//  Player.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import Foundation

struct Player: Identifiable, Codable {
    var id = UUID()
    var name: String = ""
    var wins: Int = 0
}
