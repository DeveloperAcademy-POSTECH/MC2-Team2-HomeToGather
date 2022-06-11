//
//  HostedDetailView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/12.
//

import SwiftUI

struct HostedDetailView: View {
    var hostData: Invitation
    
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
                                Text(hostData.title)
                                    .font(.system(size: 24, weight: .bold))
                                    .padding(.top, 18)
                                
                                HStack(spacing: -5) {
                                    ForEach(hostData.participantName!, id: \.self) { name in // 강제 언래핑 수정하기
                                        ParticipantView(name: name)
                                    }
                                }
                                .padding(.top, 7)
                                
                                HStack(spacing: 0) {
                                    Text("TIME: ")
                                    Text(hostData.date)
                                }
                                .padding(.top, 50)
                                
                                HStack(alignment: .top, spacing: 0) {
                                    Text("PLACE: ")
                                    Text(hostData.place)
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

struct HostedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HostedDetailView(hostData: data[0])
    }
}
