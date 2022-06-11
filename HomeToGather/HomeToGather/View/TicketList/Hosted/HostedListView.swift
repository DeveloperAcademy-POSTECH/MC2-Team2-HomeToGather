//
//  HostedListView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/12.
//

import SwiftUI

struct HostedListView: View {
    let screenWidth = UIScreen.main.bounds.width
    
    // 나중에 네비게이션으로 여길 열어야 한다면, init()에 직접 변수를 넣어야 함
    // https://stackoverflow.com/questions/56910854/swiftui-views-with-a-custom-init
    init() {
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        // 테스트용 네비게이션뷰
        NavigationView {
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
            .preferredColorScheme(.dark)
        }
    }
}

struct HostedListView_Previews: PreviewProvider {
    static var previews: some View {
        HostedListView()
    }
}
