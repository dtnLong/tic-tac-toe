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
    
    @State var newPlayer: String = ""
    @State var newPlayerError: String = " "
    @State var create: Bool = false
    @State var select: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                Spacer()
                VStack(spacing: 0) {
                    HStack {
                        Text("Hello,")
                            .font(.system(size: 55))
                            .foregroundColor(.primary)
                        if (settings.currentPlayer.name.count < 6) {
                            Text(settings.currentPlayer.name)
                                .font(.system(size: 55))
                                .foregroundColor(.primary).lineLimit(3)
                        }
                    }
                    if (settings.currentPlayer.name.count >= 6) {
                        Text(settings.currentPlayer.name)
                            .font(.system(size: 55))
                            .foregroundColor(.primary).lineLimit(3)
                    }
                }
                Spacer().frame(height: 20)
                Button(action: {
                    create = true
                }, label: {
                    Text("CREATE NEW USER")
                        .modifier(MenuButtonTextModifier())
                }).modifier(MenuButtonModifier())
                
                if settings.playerList.count != 0 {
                    Button(action: {
                        select = true
                    }, label: {
                        Text("SELECT USER")
                            .modifier(MenuButtonTextModifier())
                    }).modifier(MenuButtonModifier())
                }
                
                Spacer()
                
                HStack {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35, alignment: .center)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                }
                    .padding([.trailing, .leading], 35)
                    .padding(.bottom, 20)
            }
            
            if (create) {
                ZStack {
                    Color("transparent")
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                        
                        TextField("Player name", text: $newPlayer)
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
                            Image(systemName: "checkmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45, height: 45, alignment: .center)
                                .onTapGesture {
                                    if (!settings.playerList.filter {$0.name == newPlayer}.isEmpty ) {
                                        newPlayerError = "Name already exist"
                                        return;
                                    }
                                    
                                    settings.currentPlayer = Player(name: newPlayer, wins: 0)
                                    settings.playerList.append(settings.currentPlayer)
                                    create = false
                                    newPlayer = ""
                                    do {
                                        UserDefaults.standard.set(try JSONEncoder().encode(settings.playerList), forKey: "playerList")
                                        UserDefaults.standard.set(try JSONEncoder().encode(settings.currentPlayer), forKey: "currentPlayer")
                                    } catch {
                                        
                                    }
                                }
                            
                            Spacer()
                            
                            Image(systemName: "xmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50, alignment: .center)
                                .onTapGesture {
                                    create = false
                                    newPlayer = ""
                                }
                        }
                            .padding([.trailing, .leading], 60)
                            .padding(.bottom, 60)
                    }
                        .transition(.opacity.animation(.easeIn(duration: 0.4)))
                        .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
                        .background(Color("primary-background"))
                        .cornerRadius(20)
                }
            }
        
            if (select) {
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
                                    select = false
                                }
                        }
                            .padding([.trailing, .top], 20)
                        Spacer()
                        ScrollView {
                            VStack {
                                ForEach(settings.playerList) { player in
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
                                            settings.currentPlayer = player
                                            do {
                                                UserDefaults.standard.set(try JSONEncoder().encode(settings.currentPlayer), forKey: "currentPlayer")
                                            } catch {
                                                
                                            }
                                            select = false
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
        }.navigationBarHidden(true)
    }
}
