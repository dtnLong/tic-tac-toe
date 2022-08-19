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

struct BadgeOverlay: View {
    @Binding var showBadgeOverlay: Bool
    
    var body: some View {
        ZStack {
            Color("transparent")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack {
                    Spacer()
                    
                    // MARK: DISMISS BUTTON
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .modifier(ActionButtonModifier(width: 20, height: 20))
                        .onTapGesture {
                            showBadgeOverlay = false
                        }
                }
                .padding([.trailing, .top], 15)
                
                Spacer()
                
                // MARK: BADGE TITLE
                Text("BADGES")
                    .font(.system(size: 45, design: .rounded))
                    .foregroundColor(.primary)
                
                Spacer()
                
                // MARK: DISPLAY BADGE LIST
                ScrollView {
                    VStack {
                        BadgeItem(badgeImage: "rosette", badgeText: "Win first game")
                        BadgeItem(badgeImage: "gamecontroller", badgeText: "Play 10 games")
                        BadgeItem(badgeImage: "trash", badgeText: "Imagine losing")
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                }
            }
            .transition(.opacity.animation(.easeIn(duration: 0.4)))
            .frame(width: 350, height: 500, alignment: .center)
            .background(Color("primary-background"))
            .cornerRadius(20)
        }
    }
}
