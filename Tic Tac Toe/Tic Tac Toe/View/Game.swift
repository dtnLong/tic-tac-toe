//
//  Game.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct Game: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var moves: [String] = Array(repeating: "", count: 9)
    
    let columns: [GridItem] = Array(repeating: GridItem(.fixed(100), spacing: 0, alignment: .center), count: 3)
    
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
                                    if (moves[index] == "") {
                                        moves[index] = "circle"
                                    }
                                }
                        )
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}
