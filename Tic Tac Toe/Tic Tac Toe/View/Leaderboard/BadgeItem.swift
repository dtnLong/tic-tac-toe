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
