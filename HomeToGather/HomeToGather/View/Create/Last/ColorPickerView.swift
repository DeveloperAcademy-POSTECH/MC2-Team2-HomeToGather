//
//  ColorPickerView.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/13.
//

import SwiftUI

enum PartyColors:String,CaseIterable {
    case red,blue,green,yellow
    
    init?(rawValue: String) {
        switch rawValue {
        case "red" : self = .red
        case "blue" : self = .blue
        case "yellow": self = .yellow
        case "green": self = .green
        default: return nil
        }
    }
}


struct ColorPickerView: View {
    
    @State private var selectedColor:PartyColors = .red
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            
            VStack(spacing:0){
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        ForEach(PartyColors.allCases,id:\.self) { color in
                            ColorView(color: color, selectedColor: $selectedColor)
                                .onTapGesture {
                                    selectedColor = color
                                }
                        }
                    }
                }).background(Color.backgroundColor)
                
                ticketView(color: $selectedColor)
                    .background(Color.clear)
                
                Button {
                } label: {
                    Text("만들기")
                        .font(.system(size: 18))
                }.frame(width: 350, height: 50, alignment: .center)
                    .background(Color.partyPurple)
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
        }
        
        
    }
}
