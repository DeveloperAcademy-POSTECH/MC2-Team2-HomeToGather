//
//  ShareCardView.swift
//  HomeToGather
//
//  Created by Park Sungmin on 2022/06/15.
//

import SwiftUI

struct ShareCardView: View {
    @EnvironmentObject var partyData: PartyData
    @Binding var partyColor: PartyColors
    
    @Environment(\.rootPresentationMode) private var rootPresentationMode: Binding<RootPresentationMode>
    
    let deeplinkManager: DeeplinkManager = DeeplinkManager()
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack(spacing:0){
                
                TicketView(color: $partyColor)
                    .background(Color.clear)
                
                Button{
                   // 공유하기
                    print("DEBUG KAKAO INV ID : \(partyData.id)")
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
