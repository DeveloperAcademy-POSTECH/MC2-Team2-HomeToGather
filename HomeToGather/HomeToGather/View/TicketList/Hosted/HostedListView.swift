//
//  HostedListView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/12.
//

import Firebase
import SwiftUI

struct HostedListView: View {
    let screenWidth = UIScreen.main.bounds.width
    let uid = getUserUid()
    
    @State var selected: Bool = false
    @State var selectedHost: Invitation?
    @ObservedObject var hostedViewModel = HostedViewModel()
    
    
    init() {
        hostedViewModel.fetchInvitationsReceived(uid)
    }
    
    var body: some View {
        ZStack {
            NavigationLink (isActive: self.$selected){
                HostedDetailView(hostData: self.selectedHost ?? hostedViewModel.invitationsReceived[0], backToRoot: self.$selected)
            } label: {
                EmptyView()
            }
            .isDetailLink(false)
            
            Color.backgroundColor
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(hostedViewModel.invitationsReceived, id: \.self) { host in
                        let _ = print(host)
                        Button  {
                            self.selectedHost = host
                            self.selected = true
                        } label: {
                            ListTicketView(invitationData: host)
                                .frame(maxWidth: screenWidth)
                                .padding(.bottom, 20)
                        }

                    }
                }
            }
            .padding(20)
        }
        .navigationTitle("주최한 파티 리스트")
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
    }
}
