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
    
    @State var viewModel = ViewModel()
    
    init() {
        viewModel.fetchInvitationsReceived(uid)
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(viewModel.invitationsReceived, id: \.self) { host in
                        NavigationLink {
                            HostedDetailView(hostData: host)
                        } label: {
                            ListTicketView()
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

struct HostedListView_Previews: PreviewProvider {
    static var previews: some View {
        HostedListView()
            .previewDevice("iPhone 13 Pro")
    }
}
