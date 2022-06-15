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
    
    // 툴바 버튼에 이전뷰 전활을 위한 변수
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            ProgressBar(num: 3)
            ZStack {
                Color.backgroundColor.ignoresSafeArea()
                VStack(spacing:0){
                    HStack {
                        ForEach(PartyColors.allCases,id:\.self) { color in
                            ColorView(color: color, selectedColor: $selectedColor)
                                .onTapGesture {
                                    selectedColor = color
                                }
                        }
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 23, leading: 20, bottom: 42, trailing: 20))
                    .background(Color.backgroundColor)
                    
                    ticketView(isTicketGesture: false, color: $selectedColor)
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
        .navigationBarTitle("초대장 테마 설정", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .foregroundColor(.white)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                    Text("이전")
                        .padding(.leading, -5)
                })
                .foregroundColor(.white)
            }
        }
    }
    
}
