//
//  InvitedListView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/11.
//

import Firebase
import SwiftUI

struct InvitedListView: View {
    let screenWidth = UIScreen.main.bounds.width
    let uid = getUserUid()
    
    @State var invitedViewModel = InvitedViewModel()
    
    init() {
        invitedViewModel.fetchInvitationsSent(uid)
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(invitedViewModel.invitationsSent, id: \.self) { invitation in
                        NavigationLink {
                            InvitedDetailView(invitationData: invitation)
                        } label: {
                            ListTicketView(invitationData: invitation)
                                .frame(maxWidth: screenWidth)
                                .padding(.bottom, 20)
                        }
                    }
                }
            }
            .padding(20)
        }
        .navigationTitle("초대된 파티 리스트")
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
    }
}
