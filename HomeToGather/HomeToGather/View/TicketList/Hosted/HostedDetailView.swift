//
//  HostedDetailView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/12.
//

import SwiftUI

struct HostedDetailView: View {
    var hostData: Invitation
    @State private var isConfirmationDialogShow: Bool = false
    
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
                    
                    FeedbackCardView(title: "규칙", contents: hostData.rule, feedbackContents: hostData.ruleFeedback)
                    
                    FeedbackCardView(title: "메뉴", contents: hostData.food, feedbackContents: hostData.foodFeedback)
                }
                .padding(20)
            }
        }
        .toolbar {
            ToolbarItem {
                Button(role: .destructive, action: {
                    isConfirmationDialogShow = true
                }, label: {
                    Image(systemName: "ellipsis.circle")
                        .foregroundColor(.white)
                })
                .confirmationDialog("confirmationDialog", isPresented: $isConfirmationDialogShow, titleVisibility: .hidden) {
                    Button("공유하기") {}
                    Button("수정하기") {}
                    Button("삭제하기", role: .destructive) {}
                    Button("취소하기", role: .cancel) {}
                }
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
