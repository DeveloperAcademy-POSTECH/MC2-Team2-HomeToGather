//
//  ParticipantView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/11.
//

import SwiftUI

struct ParticipantView: View {
    var name: String
    
    let colors: [Color] = [
        Color.brandColor, Color.card1Color, Color.card2Color, Color.card3Color
    ]
    
    var body: some View {
        let index: Int = Int.random(in: 0..<colors.count)
        
        ZStack {
            Circle()
                .strokeBorder(Color.cardBackgroundColor, lineWidth: 2)
                .background(Circle().foregroundColor(colors[index]))
                .frame(width: 35, height: 35)
        
            Text(name)
                .font(.system(size: 8))
                .foregroundColor(.black)
                .lineLimit(1)
        }
    }
}

struct ParticipantView_Previews: PreviewProvider {
    static var previews: some View {
        ParticipantView(name: "정지혁")
    }
}
