//
//  ParticipantView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/11.
//

import SwiftUI

struct ParticipantView: View {
    var name: String
    var indexNum: Int
    
    let colors: [Color] = [
        Color.brandColor, Color.card1Color, Color.card2Color, Color.card3Color
    ]
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color.cardBackgroundColor, lineWidth: 2)
                .background(Circle().foregroundColor(colors[indexNum%(colors.count)]))
                .frame(width: 35, height: 35)
        
            Text(name)
//                .font(.system(size: 8))
                .font(name.guessLanguage() == "한국어" ? .notoSans(withStyle: .Regular, size: 8) : .montserrat(withStyle: .Regular, size: 8))
                .foregroundColor(.black)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(width: 23)
        }
    }
}
