//
//  Leaderboard.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct Leaderboard: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var profile: ProfileData
    
    @State var showBadgeOverlay: Bool = false;
    
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 30)
                
                // MARK: LEADERBOARD TITLE
                Text("LEADERBOARD")
                    .font(.system(size: 45, design: .rounded))
                    .foregroundColor(.primary)
                
                // MARK: LEADERBOARD LIST
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(profile.playerList.sorted(by: {
                            $0.wins > $1.wins
                        })) { player in
                            HStack {
                                Text(player.name).lineLimit(1)
                                
                                Spacer()
                                
                                Text(String(player.wins))
                                
                                Spacer().frame(width: 10)
                                
                                HStack(spacing: 10) {
                                    if (player.isBadge1) {
                                        Circle()
                                            .strokeBorder(Color.primary, lineWidth: 2)
                                            .foregroundColor(Color.clear)
                                            .frame(width: 35, height: 35, alignment: .center)
                                            .overlay(
                                                Image(systemName: "rosette")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 25, height: 25, alignment: .center)
                                            )
                                    } else {
                                        Circle()
                                            .strokeBorder(Color("gray"), lineWidth: 2)
                                            .foregroundColor(Color.clear)
                                            .frame(width: 35, height: 35, alignment: .center)
                                    }
                                    
                                    if (player.isBadge2) {
                                        Circle()
                                            .strokeBorder(Color.primary, lineWidth: 2)
                                            .foregroundColor(Color.clear)
                                            .frame(width: 35, height: 35, alignment: .center)
                                            .overlay(
                                                Image(systemName: "gamecontroller")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 25, height: 25, alignment: .center)
                                            )
                                    } else {
                                        Circle()
                                            .strokeBorder(Color("gray"), lineWidth: 2)
                                            .foregroundColor(Color.clear)
                                            .frame(width: 35, height: 35, alignment: .center)
                                    }
                                    
                                    if (player.isBadge3) {
                                        Circle()
                                            .strokeBorder(Color.primary, lineWidth: 2)
                                            .foregroundColor(Color.clear)
                                            .frame(width: 35, height: 35, alignment: .center)
                                            .overlay(
                                                Image(systemName: "trash")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 25, height: 25, alignment: .center)
                                            )
                                    } else {
                                        Circle()
                                            .strokeBorder(Color("gray"), lineWidth: 2)
                                            .foregroundColor(Color.clear)
                                            .frame(width: 35, height: 35, alignment: .center)
                                    }
                                }
                            }
                            .padding([.trailing, .leading], 35)
                            .padding([.top, .bottom], 5)
                            .overlay(
                                ZStack {
                                    if (player.id == profile.player.id) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.primary, lineWidth: 2)
                                            .padding(.horizontal, 25)
                                    } else {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.clear, lineWidth: 2)
                                    }
                                }
                            )
                                
                        }
                    }.padding(.top, 10)
                }
                
                Spacer().frame(height: 30)
                
                HStack {
                    // MARK: BACK BUTTON
                    Image(systemName: "arrow.left")
                        .resizable()
                        .modifier(ActionButtonModifier(width: 35, height: 35))
                        .onTapGesture {
                            dismiss()
                        }
                    
                    Spacer()
                    
                    // MARK: VIEW ALL BADGE BUTTON
                    Image(systemName: "rosette")
                        .resizable()
                        .modifier(ActionButtonCircleModifier())
                        .onTapGesture {
                            showBadgeOverlay = true
                        }
                }
                .padding([.trailing, .leading], 35)
                .padding(.bottom, 10)
            }
            
            // MARK: VIEW ALL BADGE OVERLAY
            if (showBadgeOverlay) {
                BadgeOverlay(showBadgeOverlay: $showBadgeOverlay)
            }
        }
        .navigationBarHidden(true)
    }
}
