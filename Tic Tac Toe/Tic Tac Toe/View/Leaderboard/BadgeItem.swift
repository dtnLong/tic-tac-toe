//
//  BadgeItem.swift
//  Tic Tac Toe
//
//  Created by Long, Dang Truong Nguyen on 19/08/2022.
//

import SwiftUI

struct BadgeItem: View {
    var badgeImage: String
    var badgeText: String
    
    var body: some View {
        HStack {
            Image(systemName: badgeImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30, alignment: .center)
            
            Spacer()
            
            Text(badgeText)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .lineLimit(1)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(.primary, lineWidth: 2)
        )
    }
}
