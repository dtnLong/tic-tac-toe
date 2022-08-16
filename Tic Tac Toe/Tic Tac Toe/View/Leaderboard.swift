//
//  Leaderboard.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 09/08/2022.
//

import SwiftUI

struct Leaderboard: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var profile: ProfileData
    
    @Environment(\.scenePhase) var scenePhase
    
    @State var viewBadgeOverlay: Bool = false;
    
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 30)
                Text("LEADERBOARD")
                    .font(.system(size: 45, design: .rounded))
                    .foregroundColor(.primary)
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
                    Image(systemName: "arrow.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35, alignment: .center)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                    Image(systemName: "rosette")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35, alignment: .center)
                        .padding(15)
                        .overlay(Circle().stroke(Color("primary"), lineWidth: 3))
                        .onTapGesture {
                            viewBadgeOverlay = true
                        }
                }
                    .padding([.trailing, .leading], 35)
                    .padding(.bottom, 20)
            }
            
            if (viewBadgeOverlay) {
                ZStack {
                    Color("transparent")
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        HStack {
                            Spacer()
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30, alignment: .center)
                                .onTapGesture {
                                    viewBadgeOverlay = false
                                }
                        }
                            .padding([.trailing, .top], 20)
                        
                        Spacer()
                        
                        Text("BADGES")
                            .font(.system(size: 45, design: .rounded))
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        ScrollView {
                            VStack {
                                HStack {
                                    Image(systemName: "rosette")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30, alignment: .center)
                                    Spacer()
                                    Text("Win first game")
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .lineLimit(1)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.primary, lineWidth: 2)
                                )
                                
                                HStack {
                                    Image(systemName: "gamecontroller")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30, alignment: .center)
                                    Spacer()
                                    Text("Play 10 games")
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .lineLimit(1)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.primary, lineWidth: 2)
                                )
                                
                                HStack {
                                    Image(systemName: "trash")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30, alignment: .center)
                                    Spacer()
                                    Text("Imagine losing")
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .lineLimit(1)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.primary, lineWidth: 2)
                                )
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
        .onChange(of: scenePhase, perform: { phase in
            if phase == .background {
                do {
                    UserDefaults.standard.set(try JSONEncoder().encode(profile.player), forKey: "player")
                    UserDefaults.standard.set(try JSONEncoder().encode(profile.playerList), forKey: "playerList")
                } catch {

                }
            }
        })
        .navigationBarHidden(true)
    }
}
