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
    
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 30)
                Text("LEADERBOARD")
                    .font(.system(size: 45, design: .rounded))
                    .foregroundColor(.primary)
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(profile.playerList) { player in
                            HStack {
                                Text(player.name).lineLimit(1)
                                Spacer()
                                Text(String(player.wins))
                            }
                            .padding([.trailing, .leading], 35)
                            .padding([.top, .bottom], 10)
                        }
                    }
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
                }
                    .padding([.trailing, .leading], 35)
                    .padding(.bottom, 20)
            }
        }.navigationBarHidden(true)
    }
}
