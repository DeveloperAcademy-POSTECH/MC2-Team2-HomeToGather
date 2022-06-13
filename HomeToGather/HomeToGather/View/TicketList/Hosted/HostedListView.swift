//
//  HostedListView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/12.
//

import SwiftUI

struct HostedListView: View {
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(data, id: \.self) { host in
                        NavigationLink {
                            HostedDetailView(hostData: host)
                        } label: {
                            // 티켓 이미지
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: screenWidth - 40, height: 155)
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
    }
}
