//
//  ticketView.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/08.
//

import SwiftUI
import UIKit

struct Triangle : Shape {
    var xOffset: CFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX * CGFloat(xOffset), y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct TicketView: View {
    var ticketViewModel: TicketViewModel
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    init(invitation: Invitation) {
        self.ticketViewModel = TicketViewModel(invitation: invitation)
    }
    
    @State var placeLabel = "PLACE"
    @State var timeLabel = "TIME"
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.white)
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(LinearGradient(gradient: Gradient(colors: [.purple, Color.partyRed]), startPoint: .top, endPoint: .bottom))
                    .padding(7)
                
                ZStack() {
                    HStack(spacing: 0) {
                        Spacer()
                        
                        VStack(spacing: 0) {
                            ZStack {
                                HStack(spacing: 0) {
                                    Spacer()
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("TItle")
                                            .font(.montserrat(withStyle: .Medium, size: 28))
                                        
                                        Text("SubTitle")
                                            .font(.montserrat(withStyle: .Medium, size: 24))
                                            .padding(.top, 24)
                                        
                                        Text("Date")
                                            .font(.montserrat(withStyle: .Medium, size: 12))
                                            .padding(.top, 24)
                                        
                                        Text("Time")
                                            .font(.montserrat(withStyle: .Medium, size: 12))
                                            .padding(.top, 2)
                                        
                                        Text("Place")
                                            .font(.montserrat(withStyle: .Medium, size: 12))
                                            .padding(.top, 30)
                                    }
                                    .rotationEffect(.degrees(90), anchor: .top)
                                    .offset(x: 42, y: 44)
                                }
                            }
                            .padding(10)
                            
                            Spacer()
                        }
                    }
                    .padding(10)
                    
                    HStack(spacing: 0) {
                        VStack(spacing: 0) {
                            Spacer()
                            
                            ZStack {
                                Image("mirrorBall")
                                    .resizable()
                                    .frame(width: 158, height: 316)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(7)
                }
                
                ZStack {
                    HStack(spacing: 0) {
                        Spacer()
                        
                        VStack(spacing: 0) {
                            Spacer()
                            
                            ZStack(alignment: .bottomLeading) {
                                Triangle()
                                    .fill(Color.white)
                                    .frame(width: 30, height: 30,alignment: .trailing)
                                
                                Triangle()
                                    .fill(Color.black)
                                    .frame(width: 24, height: 24,alignment: .trailing)
                            }
                            .rotationEffect(.degrees(-90))
                        }
                    }
                }
                .frame(maxWidth: screenWidth, maxHeight: screenHeight)
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.white)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Party Name")
                        .foregroundColor(.black)
                        .font(.montserrat(withStyle: .Medium, size: 16))
                        .padding(.bottom, 17)
                    
                    Divider()
                        .frame(width: 234, height: 1)
                        .background(.black)
                    
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(timeLabel)
                                .foregroundColor(.black)
                                .font(.montserrat(withStyle: .Medium, size: 8))
                                .padding(.bottom, 17)
                            
                            Text(placeLabel)
                                .foregroundColor(.black)
                                .font(.montserrat(withStyle: .Medium, size: 8))
                        }
                        .padding(.leading, 5)
                        .padding(.trailing, 30)
                        
                        Divider()
                            .frame(width: 1, height: 25)
                            .background(.gray)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("12:00")
                                .foregroundColor(.black)
                                .font(.montserrat(withStyle: .Medium, size: 8))
                                .padding(.bottom, 17)
                            
                            Text("D-park's House")
                                .foregroundColor(.black)
                                .font(.montserrat(withStyle: .Medium, size: 8))
                        }
                        .padding(.leading, 15)
                    }
                    .padding(.top, 12)
                }
                
                ZStack {
                    HStack(spacing: 0) {
                        Spacer()
                        
                        VStack(spacing: 0) {
                            ZStack(alignment: .bottomLeading) {
                                Triangle()
                                    .fill(Color.white)
                                    .frame(width: 30, height: 30,alignment: .trailing)
                                
                                Triangle()
                                    .fill(Color.black)
                                    .frame(width: 24, height: 24,alignment: .trailing)
                            }
                            .rotationEffect(.degrees(180))
                            
                            Spacer()
                        }
                    }
                }
                .frame(maxWidth: screenWidth, maxHeight: screenHeight)
            }
            .frame(height: 129)
        }
        .padding(20)
        .preferredColorScheme(.dark)
//        VStack {
//
//            ZStack {
//                Color.backgroundColor
//                    .ignoresSafeArea( edges: .all)
//
//                VStack(spacing:2) {
//
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 4)
//                            .fill(Color.white)
//                            .frame(width: 270, height: 400, alignment: .center)
//
//                        ZStack(alignment: .topLeading) {
//
//                            RoundedRectangle(cornerRadius: 4)
//                                .fill(LinearGradient(gradient: Gradient(colors: [.purple,ticketViewModel.color]),
//                                                     startPoint: .leading, endPoint: .trailing))
//
//                            VStack(alignment:.leading,spacing: 5) {
//
//                                Text(ticketViewModel.partyTitle)
//                                    .font(.notoSans(withStyle: .Medium, size: 28))
//                                    .foregroundColor(.white)
//
//                                Text(ticketViewModel.subTitle)
//                                    .font(.notoSans(withStyle: .Medium, size: 24))
//                                    .foregroundColor(.white)
//
//                                VStack(alignment:.leading,spacing: 3)  {
//                                    Text(ticketViewModel.yyyymmdd)
//                                        .font(.system(size:12))
//                                        .foregroundColor(.white)
//
//                                    Text(ticketViewModel.time)
//                                        .font(.system(size:12))
//                                        .foregroundColor(.white)
//
//                                }
//                                Text(ticketViewModel.place)
//                                    .bold()
//                                    .font(.system(size:12))
//                                    .foregroundColor(.white)
//                            }.offset(x: -100,y:-40)
//                        }.frame(width: 388, height: 258, alignment: .center)
//                            .rotationEffect(.degrees(90))
//
//                        Image("mirrorBall")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 135, height: 253, alignment: .leading)
//                            .offset(x: -65, y: 65)
//                        Triangle()
//                            .fill(Color.white)
//                            .frame(width: 30, height: 30,alignment: .trailing)
//                            .rotationEffect(.degrees(-90))
//                            .offset(x: 120, y: 180)
//                        Triangle()
//                            .fill(Color.black)
//                            .frame(width: 24, height: 24,alignment: .trailing)
//                            .rotationEffect(.degrees(-90))
//                            .offset(x: 123, y: 188)
//                    }.frame(width: 270, height: 400, alignment: .center)
//
//
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 4)
//                            .fill(Color.white)
//
//                        VStack(alignment:.leading,spacing:6) {
//                            Text(ticketViewModel.partyTitle)
//                                .bold()
//                                .font(.system(size:16))
//                                .foregroundColor(.black)
//                            Divider().frame(width: 234, height: 1, alignment: .center)
//                                .background(Color.black)
//                            HStack {
//                                VStack(alignment: .leading, spacing: 13) {
//                                    Text(timeLabel)
//                                        .font(.system(size:8))
//                                        .foregroundColor(.black)
//                                    Text(placeLabel)
//                                        .font(.system(size:8))
//                                        .foregroundColor(.black)
//                                }
//                                Spacer()
//                                    .frame(width: 30, height: 1, alignment: .trailing)
//                                Divider().frame(width: 1, height: 39, alignment: .center)
//                                    .background(Color.gray)
//                                Spacer()
//                                    .frame(width: 15, height: 1, alignment: .trailing)
//                                VStack(alignment: .leading, spacing: 13) {
//                                    Text(ticketViewModel.dateTime)
//                                        .font(.system(size:8))
//                                        .foregroundColor(.black)
//                                    Text(ticketViewModel.location)
//                                        .font(.system(size:8))
//                                        .foregroundColor(.black)
//                                }
//                            }
//                        }.padding(EdgeInsets(top: 18, leading: 18, bottom: 18, trailing: 18))
//                        Triangle()
//                            .fill(Color.black)
//                            .frame(width: 24, height: 24,alignment: .trailing)
//                            .rotationEffect(.degrees(-180))
//                            .offset(x: 125, y: -42)
//
//                    }.frame(width: 270, height: 70, alignment: .center)
//                }.frame(width: 260, height: 472, alignment: .center)
//            }
//        }
        
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView(invitation: data[0])
            .previewDevice("iPhone 13 Pro")
    }
}

let data: [Invitation] = [
    Invitation(
        uid: "UUID",
        organizerName: "박정훈",
        participantName: ["최은지", "정지혁", "박성민", "고정석", "정우영", "박도윤"],
        participantUid: ["Alice", "Jayden", "LED", "Journey", "Hatchlilng", "Dino"],
        title: "i!",
        date: "2022/06/17 14:13",
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
        date: "2022/06/02 14:13",
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
