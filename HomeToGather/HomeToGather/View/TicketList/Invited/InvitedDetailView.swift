//
//  InvitedDetailView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/11.
//

import SwiftUI

struct InvitedDetailView: View {
    @State private var buttonText = "doc.on.clipboard"
    
    var invitationData: Invitation
    
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.cardBackgroundColor)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            // 랜덤 이미지 위치
                            RoundedRectangle(cornerRadius: 4)
                                .frame(height: 150)
                                .cornerRadius(4)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text(invitationData.title)
                                    .font(.system(size: 24, weight: .bold))
                                    .padding(.top, 18)
                                
                                HStack(spacing: -5) {
                                    if let participants = invitationData.participantName {
                                        ForEach(participants, id: \.self) { name in
                                            let indexNum = invitationData.participantName?.firstIndex(of: name)
                                            ParticipantView(name: name, indexNum: indexNum ?? 0)
                                        }
                                    }
                                }
                                .padding(.top, 7)
                                
                                HStack(spacing: 0) {
                                    Text("TIME: ")
                                    Text(invitationData.date)
                                }
                                .padding(.top, 50)
                                
                                HStack(alignment: .top, spacing: 0) {
                                    Text("PLACE: ")
                                    Text(invitationData.place)
                                    Button(action:{
                                        copyToClipboard()
                                    }, label: {
                                        Image(systemName: buttonText)
                                            .foregroundColor(.white)
                                    })
                                    .padding(.leading, 6)
                                }
                                    .padding(.bottom, 20)
                            }
                            .padding(20)
                        }
                    }
                    .frame(maxWidth: screenWidth)
                    
                    CardView(title: "규칙", contents: invitationData.rule)
                    
                    CardView(title: "메뉴", contents: invitationData.food)
                }
                .padding(20)
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func copyToClipboard() {
        UIPasteboard.general.string = invitationData.place
        self.buttonText = "doc.on.clipboard.fill"
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
            self.buttonText = "doc.on.clipboard"
        }
    }
}
