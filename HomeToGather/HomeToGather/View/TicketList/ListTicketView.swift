//
//  ListTicketView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/13.
//

import SwiftUI

func getColorCase(color: String) -> Color {
    switch color {
    case "red":
        return Color.partyRed
    case "green":
        return Color.partyGreen
    case "blue":
        return Color.partyBlue
    case "yellow":
        return Color.partyYellow
    default:
        return Color.brandColor
    }
}

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
        ruleFeedback: ["어쩔티비도 쓰고 싶어요.", "Nice Nice도 리액션으로 추가해주세요"],
        foodFeedback: ["피자 시러요", "무 안 먹어요", "피클 안 먹음."],
        color: "red"
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
        ruleFeedback: ["어쩔티비도 쓰고 싶어요.", "Nice Nice도 리액션으로 추가해주세요"],
        foodFeedback: ["피자 시러요", "무 안 먹어요", "피클 안 먹음."],
        color: "yellow"
    )
]


struct ListTicketView: View {
    var invitationData: Invitation
    
    let screenWidth = UIScreen.main.bounds.width
    
    @State var placeLabel = "PLACE"
    @State var timeLabel = "TIME"
    
    @State var isTearTicket = false
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.white)
                    .frame(maxHeight: 155)
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(LinearGradient(gradient: Gradient(colors: [.purple, getColorCase(color: invitationData.color)]), startPoint: .leading, endPoint: .trailing))
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(invitationData.title)
                            .foregroundColor(.white)
                            .font(.montserrat(withStyle: .Medium, size: 22))
                        
                        Text(invitationData.description)
                            .foregroundColor(.white)
                            .font(.montserrat(withStyle: .Medium, size: 20))
                        
                        Text(invitationData.date)
                            .foregroundColor(.white)
                            .font(.montserrat(withStyle: .Light, size: 10))
                            .padding(.top, 5)
                        
                        Text(invitationData.place)
                            .foregroundColor(.white)
                            .font(.notoSans(withStyle: .Light, size: 10))
                            .padding(.top, 7)
                    }
                    .padding(4)
                }
                .frame(maxHeight: 148)
                .padding(5)
                
                VStack(spacing: 0) {
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Spacer()
                        
                        Image("mirrorBallRotate")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 160, height: 77)
                    }
                }
                .padding(5)
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.white)
                    .frame(maxWidth: 83, maxHeight: 155)
                
                
            }
        }
        .frame(height: 155)
        .preferredColorScheme(.dark)
//        VStack {
//            VStack(spacing: 2) {
//                ZStack {
//                    RoundedRectangle(cornerRadius: 4)
//                        .fill(.white)
//                        .frame(width: 266, height: 155, alignment: .center)
//                        .offset(x: -41)
//
//                    ZStack() {
//                        RoundedRectangle(cornerRadius: 4)
//                            .fill(LinearGradient(gradient: Gradient(colors: [.purple, getColorCase(color: invitationData.color)]),
//                                                 startPoint: .leading, endPoint: .trailing))
//                            .frame(width: 259, height: 148)
//                            .offset(x: -41)
//
//                        VStack(alignment: .leading, spacing: 5) {
//                            Text(invitationData.title)
//                                .font(.montserrat(withStyle: .Bold, size: 22))
//                                .foregroundColor(.white)
//
//                            Text(invitationData.description)
//                                .font(.montserrat(withStyle: .Bold, size: 20))
//                                .foregroundColor(.white)
//
//                            VStack(alignment: .leading, spacing: 3) {
//                                Text(invitationData.date)
//                                    .font(.montserrat(withStyle: .Light, size: 10))
//                                    .foregroundColor(.white)
//
//                                HStack(spacing: 2) {
//                                    Text(invitationData.date)
//                                        .font(.montserrat(withStyle: .Light, size: 10))
//                                        .foregroundColor(.white)
//                                }
//
//                                Text(invitationData.place)
//                                    .font(.notoSans(withStyle: .Light, size: 10))
//                                    .foregroundColor(.white)
//                            }
//                        }
//                        .offset(x: -95, y: -20)
//
//                        Image("mirrorBall")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 250, height: 150, alignment: .leading)
//                            .rotationEffect(.degrees(-90))
//                            .offset(y: -50)
//
//                        Triangle()
//                            .fill(Color.white)
//                            .frame(width: 30, height: 30,alignment: .trailing)
//                            .rotationEffect(.degrees(-45))
//                            .offset(x: 92, y: -77)
//
//                        Triangle()
//                            .fill(Color.backgroundColor)
//                            .frame(width: 24, height: 24,alignment: .trailing)
//                            .rotationEffect(.degrees(-45))
//                            .offset(x: 92, y: -78)
//                    }
//
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 4)
//                            .fill(.white)
//                            .frame(width: 155, height: 83)
//
//                        VStack(alignment: .leading, spacing: 6) {
//                            Text(invitationData.title)
//                                .font(.montserrat(withStyle: .Bold, size: 14))
//                                .foregroundColor(.black)
//
//                            Divider()
//                                .frame(width: 134, height: 1)
//                                .background(.black)
//
//                            HStack {
//                                VStack(alignment: .leading, spacing: 0) {
//                                    Text(timeLabel)
//                                        .font(.montserrat(withStyle: .Light, size: 6))
//                                        .foregroundColor(.black)
//                                        .padding(.bottom, 8)
//
//                                    Text(placeLabel)
//                                        .font(.montserrat(withStyle: .Light, size: 6))
//                                        .foregroundColor(.black)
//                                }
//
//                                Divider()
//                                    .frame(width: 1, height: 25)
//                                    .background(.gray)
//
//                                VStack(alignment: .leading, spacing: 0) {
//                                    Text(invitationData.date)
//                                        .font(.montserrat(withStyle: .Light, size: 6))
//                                        .foregroundColor(.black)
//                                        .padding(.bottom, 8)
//
//                                    Text(invitationData.place)
//                                        .font(.montserrat(withStyle: .Light, size: 6))
//                                        .foregroundColor(.black)
//                                }
//                            }
//                        }
//
//                        Triangle()
//                            .fill(Color.backgroundColor)
//                            .frame(width: 24, height: 24,alignment: .trailing)
//                            .rotationEffect(.degrees(45))
//                            .offset(x: 78, y: -38)
//                    }
//                    .rotationEffect(.degrees(-90))
//                    .offset(x: 130)
//                    .opacity(isTearTicket ? 0 : 1)
//
//                    Rectangle()
//                        .fill(Color.backgroundColor)
//                        .frame(width: 50, height: 50)
//                        .offset(x: 117, y: -53)
//                        .opacity(isTearTicket ? 1 : 0)
//                }
//            }
//        }
    }
}

struct ListTicket_Previews: PreviewProvider {
    static var previews: some View {
        ListTicketView(invitationData: data[0])
            .previewDevice("iPhone 13 Pro")
    }
}
