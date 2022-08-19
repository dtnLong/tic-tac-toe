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

struct Game: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.scenePhase) var scenePhase
    
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var profile: ProfileData
    @EnvironmentObject var matchData: MatchData
    
    @State var playerData: [String: PlayerProp] = [
        "player": PlayerProp(isMove: false, piece: "circle", turnColor: "primary"),
        "computer": PlayerProp(isMove: false, piece: "xmark", turnColor: "gray")
    ]
    @State var currentPlayer: String = "player"
    @State var currentTurn: Int = 1
    @State var gameStatus: String = ""
    @State var moves: [String] = Array(repeating: "", count: 9)
    @State var difficulty: String = ""
    @State var isResume: Bool = false
    
    let columns: [GridItem] = Array(repeating: GridItem(.fixed(100), spacing: 5, alignment: .center), count: 3)
    
    init(difficulty: String, isResume: Bool) {
        _difficulty = .init(initialValue: difficulty)
        _isResume = .init(initialValue: isResume)
    }
    
    // MARK: COMPUTER FUNCTION
    func checkFuturePlayerMove(futureMove: Int, playerMoves: [Int], computerMoves: [Int]) -> Int {
        var moveScore: Int = 0;
        
        // Check column
        let columnStartIndex: Int = futureMove % 3
        if (!computerMoves.contains(columnStartIndex) && !computerMoves.contains(columnStartIndex + 3) && !computerMoves.contains(columnStartIndex + 6)) {
            moveScore -= 1
            if (playerMoves.contains(columnStartIndex) || playerMoves.contains(columnStartIndex + 3) || playerMoves.contains(columnStartIndex + 6)) {
                moveScore -= 2
            }
        }
        
        // Check Row
        let rowStartIndex: Int = futureMove - (futureMove % 3)
        if (!computerMoves.contains(rowStartIndex) && !computerMoves.contains(rowStartIndex + 1) && !computerMoves.contains(rowStartIndex + 2)) {
            moveScore -= 1
            if (playerMoves.contains(rowStartIndex) || playerMoves.contains(rowStartIndex + 1) || playerMoves.contains(rowStartIndex + 2)) {
                moveScore -= 2
            }
        }
        
        // Check diagonal left to right
        if (futureMove == 0 || futureMove == 4 || futureMove == 8) {
            moveScore -= 1
            if (!computerMoves.contains(0) && !computerMoves.contains(4) && !computerMoves.contains(8)) {
                if (playerMoves.contains(0) || playerMoves.contains(4) || playerMoves.contains(8)) {
                    moveScore -= 2
                }
            }
        }
        
        // Check diagonal right to left
        if (futureMove == 2 || futureMove == 4 || futureMove == 6) {
            moveScore -= 1
            if (!computerMoves.contains(2) && !computerMoves.contains(4) && !computerMoves.contains(6)) {
                if (playerMoves.contains(2) || playerMoves.contains(4) || playerMoves.contains(6)) {
                    moveScore -= 2
                }
            }
        }
        
        return moveScore
    }
    
    func computerMove(playerMove: Int) -> Void {
        let computerPiece = playerData["computer"]!.piece
        let playerPiece = playerData["player"]!.piece
        
        var possibleMoves: [Int] = []
        var computerMoves: [Int] = []
        var playerMoves: [Int] = []
        
        for (index, move) in moves.enumerated() {
            if (move == playerPiece) {
                playerMoves.append(index)
            } else if (move == computerPiece) {
                computerMoves.append(index)
            } else {
                possibleMoves.append(index)
            }
        }
        
        if (difficulty == "easy") {
            moves[possibleMoves[Int.random(in: 0..<possibleMoves.count)]] = computerPiece
            return
        }
        
        if (currentTurn == 2) {
            if (difficulty == "normal") {
                moves[possibleMoves[Int.random(in: 0..<possibleMoves.count)]] = computerPiece
                return
            }
            
            if (moves[4] == "") {
                moves[4] = computerPiece
                return
            } else {
                let possibleMove = [0, 2, 6, 8]
                moves[possibleMove[Int.random(in: 0...3)]] = computerPiece
                return
            }
        }
        
        // Check column win
        for columnStartIndex in 0...2 {
            if (moves[columnStartIndex] != playerPiece && moves[columnStartIndex + 3] != playerPiece && moves[columnStartIndex + 6] != playerPiece) {
                if (moves[columnStartIndex] == computerPiece && moves[columnStartIndex + 3] == computerPiece) {
                    moves[columnStartIndex + 6] = computerPiece
                    return
                } else if (moves[columnStartIndex] == computerPiece && moves[columnStartIndex + 6] == computerPiece) {
                    moves[columnStartIndex + 3] = computerPiece
                    return
                } else if (moves[columnStartIndex + 3] == computerPiece && moves[columnStartIndex + 6] == computerPiece) {
                    moves[columnStartIndex] = computerPiece
                    return
                }
            }
        }
        
        // Check row win
        for rowStartIndex in stride(from: 0, to: 7, by: 3) {
            if (moves[rowStartIndex] != playerPiece && moves[rowStartIndex + 1] != playerPiece && moves[rowStartIndex + 2] != playerPiece) {
                if (moves[rowStartIndex] == computerPiece && moves[rowStartIndex + 1] == computerPiece) {
                    moves[rowStartIndex + 2] = computerPiece
                    return
                } else if (moves[rowStartIndex] == computerPiece && moves[rowStartIndex + 2] == computerPiece) {
                    moves[rowStartIndex + 1] = computerPiece
                    return
                } else if (moves[rowStartIndex + 1] == computerPiece && moves[rowStartIndex + 2] == computerPiece) {
                    moves[rowStartIndex] = computerPiece
                    return
                }
            }
        }
        
        // Check left to right diagonal to win
        if (moves[0] != playerPiece && moves[4] != playerPiece && moves[8] != playerPiece) {
            if (moves[0] == computerPiece && moves[4] == computerPiece) {
                moves[8] = computerPiece
                return
            } else if (moves[0] == computerPiece && moves[8] == computerPiece) {
                moves[4] = computerPiece
                return
            } else if (moves[4] == computerPiece && moves[8] == computerPiece) {
                moves[0] = computerPiece
                return
            }
        }
        
        // Check right to left diagonal to win
        if (moves[2] != playerPiece && moves[4] != playerPiece && moves[6] != playerPiece) {
            if (moves[2] == computerPiece && moves[4] == computerPiece) {
                moves[6] = computerPiece
                return
            } else if (moves[2] == computerPiece && moves[6] == computerPiece) {
                moves[4] = computerPiece
                return
            } else if (moves[4] == computerPiece && moves[6] == computerPiece) {
                moves[2] = computerPiece
                return
            }
        }
        
        // Check column to block
        let columnStartIndex: Int = playerMove % 3
        if (moves[columnStartIndex] != computerPiece && moves[columnStartIndex + 3] != computerPiece && moves[columnStartIndex + 6] != computerPiece) {
            if (moves[columnStartIndex] == playerPiece && moves[columnStartIndex + 3] == playerPiece) {
                moves[columnStartIndex + 6] = computerPiece
                return
            } else if (moves[columnStartIndex] == playerPiece && moves[columnStartIndex + 6] == playerPiece) {
                moves[columnStartIndex + 3] = computerPiece
                return
            } else if (moves[columnStartIndex + 3] == playerPiece && moves[columnStartIndex + 6] == playerPiece) {
                moves[columnStartIndex] = computerPiece
                return
            }
        }
        
        // Check row to block
        let rowStartIndex: Int = playerMove - (playerMove % 3)
        if (moves[rowStartIndex] != computerPiece && moves[rowStartIndex + 1] != computerPiece && moves[rowStartIndex + 2] != computerPiece) {
            if (moves[rowStartIndex] == playerPiece && moves[rowStartIndex + 1] == playerPiece) {
                moves[rowStartIndex + 2] = computerPiece
                return
            } else if (moves[rowStartIndex] == playerPiece && moves[rowStartIndex + 2] == playerPiece) {
                moves[rowStartIndex + 1] = computerPiece
                return
            } else if (moves[rowStartIndex + 1] == playerPiece && moves[rowStartIndex + 2] == playerPiece) {
                moves[rowStartIndex] = computerPiece
                return
            }
        }
        
        // Check left to right diagonal to block
        if (playerMove == 0 || playerMove == 4 || playerMove == 8) {
            if (moves[0] != computerPiece && moves[4] != computerPiece && moves[8] != computerPiece) {
                if (moves[0] == playerPiece && moves[4] == playerPiece) {
                    moves[8] = computerPiece
                    return
                } else if (moves[0] == playerPiece && moves[8] == playerPiece) {
                    moves[4] = computerPiece
                    return
                } else if (moves[4] == playerPiece && moves[8] == playerPiece) {
                    moves[0] = computerPiece
                    return
                }
            }
        }
        
        // Check right to left diagonal to block
        if (playerMove == 2 || playerMove == 4 || playerMove == 6) {
            if (moves[2] != computerPiece && moves[4] != computerPiece && moves[6] != computerPiece) {
                if (moves[2] == playerPiece && moves[4] == playerPiece) {
                    moves[6] = computerPiece
                    return
                } else if (moves[2] == playerPiece && moves[6] == playerPiece) {
                    moves[4] = computerPiece
                    return
                } else if (moves[4] == playerPiece && moves[6] == playerPiece) {
                    moves[2] = computerPiece
                    return
                }
            }
        }
        
        // Check piece to move when there is no block or win
        var maxScore: Int = -1
        var move: Int = 0
        
        for possibleMove in possibleMoves {
            var moveScore = 0;
            
            // Check column
            let columnStartIndex: Int = possibleMove % 3
            let columnArray: [Int] = [columnStartIndex, columnStartIndex + 3, columnStartIndex + 6]
            if (computerMoves.contains(columnStartIndex) || computerMoves.contains(columnStartIndex + 3) || computerMoves.contains(columnStartIndex + 6)) {
                if (!playerMoves.contains(columnStartIndex) && !playerMoves.contains(columnStartIndex + 3) && !playerMoves.contains(columnStartIndex + 6)) {
                    moveScore += 4
                    
                    var futurePlayerMove: Int = 0
                    for i in columnArray {
                        if (!computerMoves.contains(i) && possibleMove != i) {
                            futurePlayerMove = i
                            break;
                        }
                    }
                    moveScore += checkFuturePlayerMove(futureMove: futurePlayerMove, playerMoves: playerMoves, computerMoves: computerMoves)
                    
                }
            } else if (playerMoves.contains(columnStartIndex) || playerMoves.contains(columnStartIndex + 3) || playerMoves.contains(columnStartIndex + 6)) {
                moveScore += 1
            }
            
            // Check row
            let rowStartIndex: Int = possibleMove - (possibleMove % 3)
            let rowArray: [Int] = [rowStartIndex, rowStartIndex + 1, rowStartIndex + 2]
            if (computerMoves.contains(rowStartIndex) || computerMoves.contains(rowStartIndex + 1) || computerMoves.contains(rowStartIndex + 2)) {
                if (!playerMoves.contains(rowStartIndex) && !playerMoves.contains(rowStartIndex + 1) && !playerMoves.contains(rowStartIndex + 2)) {
                    moveScore += 4
                    
                    var futurePlayerMove: Int = 0
                    for i in rowArray {
                        if (!computerMoves.contains(i) && possibleMove != i) {
                            futurePlayerMove = i
                            break;
                        }
                    }
                    moveScore += checkFuturePlayerMove(futureMove: futurePlayerMove, playerMoves: playerMoves, computerMoves: computerMoves)
                }
            } else if (playerMoves.contains(rowStartIndex) || playerMoves.contains(rowStartIndex + 1) || playerMoves.contains(rowStartIndex + 2)) {
                moveScore += 1
            }
            
            // Check left to right diagonal
            if (possibleMove == 0 || possibleMove == 4 || possibleMove == 8) {
                if (computerMoves.contains(0) || computerMoves.contains(4) || computerMoves.contains(8)) {
                    if (!playerMoves.contains(0) && !playerMoves.contains(4) && !playerMoves.contains(8)) {
                        moveScore += 4
                        
                        var futurePlayerMove: Int = 0
                        for i in [0, 4, 8] {
                            if (!computerMoves.contains(i) && possibleMove != i) {
                                futurePlayerMove = i
                                break;
                            }
                        }
                        moveScore += checkFuturePlayerMove(futureMove: futurePlayerMove, playerMoves: playerMoves, computerMoves: computerMoves)
                    }
                } else if (playerMoves.contains(0) || playerMoves.contains(4) || playerMoves.contains(8)) {
                    moveScore += 1
                }
            }
            
            
            // Check right to left diagonal
            if (possibleMove == 2 || possibleMove == 4 || possibleMove == 6) {
                if (computerMoves.contains(2) || computerMoves.contains(4) || computerMoves.contains(6)) {
                    if (!playerMoves.contains(2) && !playerMoves.contains(4) && !playerMoves.contains(6)) {
                        moveScore += 4
                        
                        var futurePlayerMove: Int = 0
                        for i in [2, 4, 6] {
                            if (!computerMoves.contains(i) && possibleMove != i) {
                                futurePlayerMove = i
                                break;
                            }
                        }
                        moveScore += checkFuturePlayerMove(futureMove: futurePlayerMove, playerMoves: playerMoves, computerMoves: computerMoves)
                    }
                } else if (playerMoves.contains(2) || playerMoves.contains(4) || playerMoves.contains(6)) {
                    moveScore += 1
                }
            }
            
            
            if (moveScore > maxScore) {
                maxScore = moveScore
                move = possibleMove
            }
        }
        
        moves[move] = computerPiece
        return
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
    
    // MARK: GAME CONTROLLER
    
    func endTurn(move: Int) -> Void {
        var scoreChange: Int = 0
        if checkWin(move: move) {
            if (currentPlayer == "computer") {
                gameStatus = "YOU LOSE"
                scoreChange = -1
            } else {
                gameStatus = "YOU WIN"
                scoreChange = 1
            }
            
            if (profile.player.type == .guest) {
                return
            }
            
            for (index, player) in profile.playerList.enumerated() {
                if (player.id == profile.player.id) {
                    profile.playerList[index].wins += scoreChange
                    profile.playerList[index].games += 1
                    
                    if (!profile.playerList[index].isBadge1) {
                        if (gameStatus == "YOU WIN") {
                            profile.playerList[index].isBadge1 = true
                        }
                    }
                    
                    if (!profile.playerList[index].isBadge2) {
                        if (profile.playerList[index].games == 10) {
                            profile.playerList[index].isBadge2 = true
                        }
                    }
                    
                    if (!profile.playerList[index].isBadge3) {
                        if (gameStatus == "YOU LOSE") {
                            profile.playerList[index].isBadge3 = true
                        }
                    }
                }
            }
            return
        }
        
        // Check tie
        if currentTurn == 9 {
            gameStatus = "DRAW"
            
            for (index, player) in profile.playerList.enumerated() {
                if (player.id == profile.player.id) {
                    profile.playerList[index].games += 1
                    
                    if (!profile.playerList[index].isBadge2) {
                        if (profile.playerList[index].games == 10) {
                            profile.playerList[index].isBadge2 = true
                        }
                    }
                }
            }
            
            return
        }
        
        currentTurn += 1
        playerData[currentPlayer]!.turnColor = "gray"
        if (currentPlayer == "computer") {
            currentPlayer = "player"
        } else {
            currentPlayer = "computer"
        }
        playerData[currentPlayer]!.turnColor = "primary"
        playerData[currentPlayer]!.isMove = false;
        
        if (currentPlayer == "computer") {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                computerMove(playerMove: move)
                playerData[currentPlayer]!.isMove = true;
//                playSound(sound: "place-piece", type: "wav", volumeScale: 1)
            }
        }
    }
    
    func restartGame() -> Void {
        currentPlayer = "player"
        currentTurn = 1
        gameStatus = ""
        moves = Array(repeating: "", count: 9)
        
        withAnimation() {
            playerData["player"]!.isMove = false
            playerData["player"]!.turnColor = "primary"
            
            playerData["computer"]!.isMove = false
            playerData["computer"]!.turnColor = "gray"
        }
    }
    
    func dismissView() -> Void {
        matchData.isResume = true
        matchData.matchData.moves = moves
        matchData.matchData.currentPlayer = currentPlayer
        matchData.matchData.difficulty = difficulty
        matchData.matchData.gameStatus = gameStatus
        matchData.matchData.currentTurn = currentTurn
        matchData.matchData.playerData = playerData
        dismiss()
    }
    
    func endGame() -> Void {
        matchData.isResume = false
        dismiss()
    }
    
    // MARK: GAME VIEW
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                // MARK: CURRENT TURN DISPLAY
                HStack {
                    Spacer()
                    Image(systemName: "person")
                        .resizable()
                        .modifier(TurnDisplayModifier(color: playerData["player"]!.turnColor))
                    Spacer()
                    Image(systemName: "desktopcomputer")
                        .resizable()
                        .modifier(TurnDisplayModifier(color: playerData["computer"]!.turnColor))
                    Spacer()
                }
                
                Spacer().frame(height: 60)
                
                // MARK: BOARD DISPLAY
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(0..<9, id: \.self) {index in
                        Rectangle()
                            .foregroundColor(Color("primary-background"))
                            .frame(width: 100, height: 100)
                            .overlay(
                                VStack {
                                    if (moves[index] != "") {
                                        Image(systemName: moves[index])
                                            .resizable()
                                            .foregroundColor(.primary)
                                            .frame(width: 60, height: 60)
                                            .transition(.opacity.animation(.easeIn(duration: 0.3)))
                                            .onAppear {
                                                if (playerData[currentPlayer]!.isMove) {
                                                    playSound(sound: "place-piece", type: "wav", volumeScale: 1)
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                        withAnimation() {
                                                            endTurn(move: index)
                                                        }
                                                    }
                                                }
                                            }
                                    }
                                }
                            )
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if (moves[index] == "" && !(playerData[currentPlayer]!.isMove) && currentPlayer != "computer") {
                                    playerData[currentPlayer]!.isMove = true
                                    moves[index] = playerData[currentPlayer]!.piece
//                                    playSound(sound: "place-piece", type: "wav", volumeScale: 1)
                                }
                            }
                    }
                }
                .frame(width: 320, height: 320)
                .background(Color.primary)
                
                
                Spacer()
                
                HStack {
                    // MARK: BACK BUTTON
                    Image(systemName: "arrow.left")
                        .resizable()
                        .modifier(ActionButtonModifier(width: 35, height: 35))
                        .foregroundColor(Color(playerData[currentPlayer]!.turnColor))
                        .onTapGesture {
                            if (currentPlayer == "player") {
                                dismissView()
                            }
                        }
                    
                    Spacer()
                    
                    // MARK: RESTART BUTTON
                    Image(systemName: "arrow.2.circlepath")
                        .resizable()
                        .modifier(ActionButtonModifier())
                        .onTapGesture {
                            restartGame()
                        }
                }
                .padding([.trailing, .leading], 35)
                .padding(.bottom, 10)
            }
            
            // MARK: GAME OVER OVERLAY
            if (gameStatus != "") {
                GameOverOverlay(gameStatus: $gameStatus, restartGame: restartGame, endGame: endGame)
            }
        }
        .onAppear() {
            // Stop all audio
            audioPlayer?.stop()
            
            // Load save data when resume
            if (isResume) {
                currentPlayer = matchData.matchData.currentPlayer
                currentTurn = matchData.matchData.currentTurn
                gameStatus = matchData.matchData.gameStatus
                moves = matchData.matchData.moves
                difficulty = matchData.matchData.difficulty
            }
        }
        .onChange(of: scenePhase) { phase in
            if (phase == .inactive) {
                matchData.isResume = true
                matchData.matchData.moves = moves
                matchData.matchData.currentPlayer = currentPlayer
                matchData.matchData.difficulty = difficulty
                matchData.matchData.gameStatus = gameStatus
                matchData.matchData.currentTurn = currentTurn
                matchData.matchData.playerData = playerData
            }
        }
        .navigationBarHidden(true)
    }
}
