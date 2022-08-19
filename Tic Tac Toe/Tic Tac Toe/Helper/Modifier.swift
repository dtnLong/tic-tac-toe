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

struct ActionButtonModifier: ViewModifier {
    var width: CGFloat = 50
    var height: CGFloat = 50
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height, alignment: .center)
            .foregroundColor(.primary)
    }
}

struct ActionButtonCircleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: 35, height: 35, alignment: .center)
            .padding(15)
            .overlay(Circle().stroke(Color("primary"), lineWidth: 3))
    }
}

struct TurnDisplayModifier: ViewModifier {
    var color: String;
    
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
