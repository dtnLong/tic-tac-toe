//
//  ProfileData.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 13/08/2022.
//

import Foundation

class ProfileData: ObservableObject {
    @Published var player: Player = Player(name: "Guest")
    @Published var playerList: [Player] = []
}
