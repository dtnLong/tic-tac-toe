//
//  ResumeData.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 13/08/2022.
//

import Foundation
import SwiftUI

class MatchData: ObservableObject {
    @Published var isResume: Bool = false
    @Published var matchData: Match = Match()
}
