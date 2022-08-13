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
    @State var create: Bool = false
    @State var select: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Button(action: {
                    create = true
                }, label: {
                    Text("CREATE NEW USER")
                        .modifier(MenuButtonTextModifier())
                }).modifier(MenuButtonModifier())
                
                if settings.playerList.count != 0 {
                    Button(action: {
                        
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
                            .onSubmit {
                                
                            }
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "checkmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45, height: 45, alignment: .center)
                                .onTapGesture {
                                    settings.currentPlayer = Player(name: newPlayer, wins: 0)
                                    settings.playerList.append(settings.currentPlayer)
                                    create = false
                                    newPlayer = ""
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
        
//            if (select) {
//                ZStack {
//                    Color("transparent")
//                        .edgesIgnoringSafeArea(.all)
//                    VStack{
//
//                    }
//                        .padding([.trailing, .leading], 60)
//                        .padding(.bottom, 60)
//                }
//                    .transition(.opacity.animation(.easeIn(duration: 0.4)))
//                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
//                    .background(Color("primary-background"))
//                    .cornerRadius(20)
//            }
        }.navigationBarHidden(true)
    }
}
