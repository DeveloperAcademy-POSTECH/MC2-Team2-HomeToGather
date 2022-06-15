//
//  InvitedListView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/11.
//

import Firebase
import SwiftUI

let data: [Invitation] = [
    Invitation(
        uid: "UUID",
        organizerName: "박정훈",
        participantName: ["최은지", "정지혁", "박성민", "고정석", "정우영", "박도윤"],
        participantUid: ["Alice", "Jayden", "LED", "Journey", "Hatchlilng", "Dino"],
        title: "i!",
        date: "2022. 06. 20",
        place: "경북 포항시 지곡로 83(포스빌) 0동 000호",
        description: "디박이네 집들이",
        rule: ["말 끝마다 Assertive 필수", "리액션은 'Good Good'로 하기"],
        cost: "10,000원",
        food: ["치킨", "도넛", "연어", "토스트"],
        etc: ["기타 사항 없앴슴미당"],
        image: "party",
        ruleFeedback: ["어쩔티비도 쓰고 싶어요.", "Nice Nice도 리액션으로 추가해주세요"],
        foodFeedback: ["피자 시러요", "무 안 먹어요", "피클 안 먹음."],
        color: "brandColor"
    ),
    Invitation(
        uid: "UUID.self",
        organizerName: "박성민",
        participantName: ["최은지", "고정석", "정우영", "박도윤"],
        participantUid: ["Alice", "Journey", "Hatchlilng", "Dino"],
        title: "i!!i",
        date: "2022. 06. 24",
        place: "경북 포항시 지곡로 83(포스빌) 0동 000호",
        description: "기념일",
        rule: ["말 끝마다 Assertive 금지", "리액션은 'Good Good'로 안하기"],
        cost: "",
        food: ["치킨", "광어", "삼겹살"],
        etc: ["기타 사항 없앴슴미당"],
        image: "party",
        ruleFeedback: ["어쩔티비도 쓰고 싶어요.", "Nice Nice도 리액션으로 추가해주세요"],
        foodFeedback: ["피자 시러요", "무 안 먹어요", "피클 안 먹음."],
        color: "card1Color"
    )
]

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
        .navigationTitle("초대된 파티 리스트")
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
    }
}

struct InvitedListView_Previews: PreviewProvider {
    static var previews: some View {
        InvitedListView()
    }
}
