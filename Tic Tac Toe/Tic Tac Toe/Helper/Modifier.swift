//
//  Modifier.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import Foundation

import SwiftUI

struct MenuButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 280, height: 50)
            .background(Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.primary, lineWidth: 3)
            )
    }
}

struct MenuButtonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25))
            .foregroundColor(.primary)
    }
}

struct TurnDisplayModifier: ViewModifier {
    @Binding var color: String;
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(color))
            .frame(width: 50, height: 50)
            .padding(30)
            .clipped()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(color),lineWidth: 4))
    }
}
