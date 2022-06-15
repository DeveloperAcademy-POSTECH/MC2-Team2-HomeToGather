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
    @State private var viewModel = ViewModel()
    @EnvironmentObject var partyData: PartyData
    
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
                    .padding(EdgeInsets(top: 13, leading: 20, bottom: 22, trailing: 20))
                    .background(Color.backgroundColor)
                    
                    TicketView(color: $selectedColor)
                        .background(Color.clear)
                    
                    Button {
                        let newInvitation = Invitation(uid: getUserUid(), organizerName: "디박test", title: partyData.title, date: partyData.date, place: partyData.place, description: partyData.description, rule: partyData.rule, cost: partyData.cost, food: partyData.food, etc: [""], color: "red")
                        
                        viewModel.uploadInvitation(newInvitation)
                        
                        let deeplink = DeeplinkManager()
                        deeplink.shareLinkToKakao(invitationID: "2A3A5E21-26BC-4D8F-B56A-677945469C69")
                    } label: {
                        Text("만들기")
                            .font(.system(size: 18))
                    }.frame(width: 350, height: 50, alignment: .center)
                        .background(Color.partyPurple)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
                }
            }
        }
    }
}
