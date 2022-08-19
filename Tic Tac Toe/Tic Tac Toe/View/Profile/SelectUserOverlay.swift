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

struct SelectUserOverlay: View {
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var profile: ProfileData
    @EnvironmentObject var matchData: MatchData
    
    @Binding var showSelectUserOverlay: Bool
    
    var body: some View {
        ZStack {
            Color("transparent")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack {
                    Spacer()
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .modifier(ActionButtonModifier(width: 20, height: 20))
                        .onTapGesture {
                            showSelectUserOverlay = false
                        }
                }
                    .padding([.trailing, .top], 15)
                
                Spacer()
                
                ScrollView {
                    VStack {
                        ForEach(profile.playerList) { player in
                            Text(player.name)
                                .font(.system(size: 20))
                                .frame(width: 280, height: 50, alignment: .center)
                                .padding(.horizontal, 10)
                                .lineLimit(1)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.primary, lineWidth: 2)
                                )
                                .onTapGesture {
                                    profile.player = player
                                    matchData.isResume = false
                                    showSelectUserOverlay = false
                                }
                        }
                    }
                    .padding(10)
                }
            }
            .transition(.opacity.animation(.easeIn(duration: 0.4)))
            .frame(width: 330, height: 500, alignment: .center)
            .background(Color("primary-background"))
            .cornerRadius(20)
        }
    }
}
