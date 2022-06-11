//
//  InvitedDetailView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/11.
//

import SwiftUI

struct InvitedDetailView: View {
    var invitationData: Invitation
    
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ZStack {
                        // 랜덤 이미지 위치
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.cardBackgroundColor)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            RoundedRectangle(cornerRadius: 4)
                                .frame(height: 150)
                                .cornerRadius(4)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text(invitationData.title)
                                    .font(.system(size: 24, weight: .bold))
                                    .padding(.top, 18)
                                
                                HStack(spacing: -5) {
                                    ForEach(invitationData.participantName!, id: \.self) { name in // 강제 언래핑 수정하기
                                        // 초대된 사람 원 위치
                                        Circle()
                                            .frame(width: 50, height: 50)
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
                                        UIPasteboard.general.setValue(invitationData.place, forPasteboardType: "public.plain-text")
                                    }, label: {
                                        Image(systemName: "doc.on.doc")
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
                }
                .padding(20)
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct InvitedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InvitedDetailView(invitationData: data[0])
    }
}
