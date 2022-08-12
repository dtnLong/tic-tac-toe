//
//  CircleImage.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 12/08/2022.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
        
        var body: some View {
            image
                .resizable()
                .frame(width: 80, height: 80)
                .padding(30)
                .clipped()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color("primary"),lineWidth: 8))
        }
}
