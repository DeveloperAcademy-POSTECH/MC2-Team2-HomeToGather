//
//  ShareCardView.swift
//  HomeToGather
//
//  Created by Park Sungmin on 2022/06/15.
//

import SwiftUI

struct ShareCardView: View {
    @EnvironmentObject var partyData: PartyData
    
    @Environment(\.rootPresentationMode) private var rootPresentationMode: Binding<RootPresentationMode>


    let deeplinkManager: DeeplinkManager = DeeplinkManager()
    let newInvitation: Invitation
    
    
    init(newInvitaion: Invitation) {
        self.newInvitation = newInvitaion
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack(spacing:0){
                
                TicketView(invitation: newInvitation)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 20)
                    .background(Color.clear)
                
                Button{
                    // 공유하기
                    deeplinkManager.shareLinkToKakao(invitationID: newInvitation.id)
                    
                } label: {
                    Text("카카오톡으로 공유하기")
                        .font(.system(size: 18))
                        .frame(width: 350, height: 50, alignment: .center)
                        .background(Color.partyPurple)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .navigationBarTitle("초대장", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .foregroundColor(.white)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.rootPresentationMode.wrappedValue.dismissRoot()
                    }, label: {
                        Image(systemName: "house.fill")
                    })
                    .foregroundColor(.white)
                }
            }
        }
    }
}
