//
//  NewUserOverlay.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 19/08/2022.
//

import SwiftUI

struct NewUserOverlay: View {
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var profile: ProfileData
    @EnvironmentObject var matchData: MatchData
    
    @Binding var showNewUserOverlay: Bool
    
    @State var newPlayer: String = ""
    @State var newPlayerError: String = " "
    
    var body: some View {
        ZStack {
            Color("transparent")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // MARK: NEW PLAYER NAME TEXTFIELD
                TextField("Name", text: $newPlayer)
                    .font(.system(size: 25))
                    .frame(width: 250, height: 60)
                    .background(Color.clear)
                    .multilineTextAlignment(.center)
                    .disableAutocorrection(true)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.primary, lineWidth: 3)
                            .frame(width: 280, height: 70)
                    )
                
                Spacer().frame(height: 20)
                
                // MARK: NEW PLAYER NAME ERROR
                HStack {
                    if (newPlayerError != " ") {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 14, height: 14, alignment: .center)
                    }
                    
                    Text(newPlayerError)
                        .font(.system(size: 14))
                        .foregroundColor(.primary)
                }
                
                Spacer()
                
                HStack {
                    // MARK: CREATE NEW PLAYER BUTTON
                    Image(systemName: "checkmark")
                        .resizable()
                        .modifier(ActionButtonModifier())
                        .onTapGesture {
                            if (!profile.playerList.filter {$0.name == newPlayer}.isEmpty ) {
                                newPlayerError = "Name already exist"
                                return;
                            }
                            
                            profile.player = Player(name: newPlayer, type: .account, wins: 0)
                            profile.playerList.append(profile.player)
                            matchData.isResume = false
                            
                            showNewUserOverlay = false
                            newPlayer = ""
                        }
                    
                    Spacer()
                    
                    // MARK: DISMISS BUTTON
                    Image(systemName: "xmark")
                        .resizable()
                        .modifier(ActionButtonModifier())
                        .onTapGesture {
                            showNewUserOverlay = false
                            newPlayer = ""
                        }
                }
                .padding([.trailing, .leading], 60)
                .padding(.bottom, 60)
            }
            .transition(.opacity.animation(.easeIn(duration: 0.4)))
            .frame(width: 330, height: 300, alignment: .center)
            .background(Color("primary-background"))
            .cornerRadius(20)
        }
    }
}
