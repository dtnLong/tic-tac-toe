//
//  Profile.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct Profile: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var profile: ProfileData
    
    @State var showNewUserOverlay: Bool = false
    @State var showSelectUserOverlay: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                Spacer()
                
                // MARK: CURRENT USER NAME
                VStack(spacing: 0) {
                    HStack {
                        Text("Hello,")
                            .font(.system(size: 55))
                            .foregroundColor(.primary)
                        if (profile.player.name.count < 6) {
                            Text(profile.player.name)
                                .font(.system(size: 55))
                                .foregroundColor(.primary).lineLimit(3)
                        }
                    }
                    if (profile.player.name.count >= 6) {
                        Text(profile.player.name)
                            .font(.system(size: 55))
                            .foregroundColor(.primary).lineLimit(3)
                    }
                }
                
                Spacer().frame(height: 20)
                
                // MARK: CREATE NEW PLAYER BUTTON
                Button(action: {
                    showNewUserOverlay = true
                }, label: {
                    Text("CREATE NEW USER")
                        .modifier(MenuButtonTextModifier())
                }).modifier(MenuButtonModifier())
                
                // MARK: SELECT EXISTING USER BUTTON
                if (profile.playerList.count != 0) {
                    Button(action: {
                        showSelectUserOverlay = true
                    }, label: {
                        Text("SELECT USER")
                            .modifier(MenuButtonTextModifier())
                    }).modifier(MenuButtonModifier())
                }
                
                Spacer()
                
                HStack {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .modifier(ActionButtonModifier(width: 35, height: 35))
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    
                    Spacer()
                }
                .padding([.trailing, .leading], 35)
                .padding(.bottom, 20)
            }
            
            // MARK: CREATE NEW USER OVERLAY
            if (showNewUserOverlay) {
                NewUserOverlay(showNewUserOverlay: $showNewUserOverlay)
            }
        
            // MARK: SELECT USER OVERLAY
            if (showSelectUserOverlay) {
                SelectUserOverlay(showSelectUserOverlay: $showSelectUserOverlay)
            }
        }
        .navigationBarHidden(true)
    }
}
