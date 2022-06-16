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
    
    @ObservedObject var hostedViewModel = HostedViewModel()
    @State private var selectedHostedData: Invitation = Invitation.dummyInvitation
    @State private var clicked: Bool = false
    
    init() {
        hostedViewModel.fetchInvitationsReceived(uid)
    }
    
    var body: some View {
        ZStack {
            VStack{
                NavigationLink(isActive: self.$clicked) {
                    HostedDetailView(hostData: selectedHostedData)
                } label: {
                    EmptyView()
                }
                .isDetailLink(false)
            }
            
            Color.backgroundColor
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(hostedViewModel.invitationsReceived, id: \.self) { host in
                        ListTicketView(invitationData: host)
                            .frame(maxWidth: screenWidth)
                            .padding(.bottom, 20)
                            .onTapGesture {
                                self.selectedHostedData = host
                                clicked.toggle()
                            }
                        
                        //                        NavigationLink {
                        //                            HostedDetailView(hostData: host)
                        //                        } label: {
                        
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
