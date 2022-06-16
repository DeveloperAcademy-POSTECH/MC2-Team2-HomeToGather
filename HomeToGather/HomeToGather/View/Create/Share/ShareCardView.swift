//
//  ShareCardView.swift
//  HomeToGather
//
//  Created by Park Sungmin on 2022/06/15.
//

import SwiftUI

struct ShareCardView: View {
    @EnvironmentObject var partyData: PartyData
    
    let deeplinkManager: DeeplinkManager = DeeplinkManager()
    let newInvitation: Invitation

    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack(spacing:0){
                
//                TicketView(color: $partyData.color)
//                    .background(Color.clear)
                
                Button{
                   // 공유하기
                    deeplinkManager.shareLinkToKakao(invitationID: partyData.id)

                } label: {
                    Text("카카오톡으로 공유하기")
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
