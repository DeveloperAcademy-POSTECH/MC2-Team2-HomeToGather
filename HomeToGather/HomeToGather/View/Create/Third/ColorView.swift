//
//  ColorView.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/13.
//

import SwiftUI

struct ColorView: View {
    @State var color: PartyColors
    @Binding var selectedColor: PartyColors
    
    var body: some View {
        ZStack {
            
            Circle()
                .fill(Color.getColor(color: color))
                .frame(width: 40, height: 40)
            
            if selectedColor == color {
                Image(systemName:"checkmark")
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
            }
        }
    }
}
