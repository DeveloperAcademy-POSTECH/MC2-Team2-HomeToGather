//
//  expanedTicketView.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/11.
//

import SwiftUI

struct ExpanedTicketView: View {
    
    var ticketViewModel: TicketViewModel
    
    init(invitation: Invitation) {
        self.ticketViewModel = TicketViewModel(invitation: invitation)
    }
    
    @State var placeLabel = "PLACE"
    @State var timeLabel = "TIME"

    @State var isTearTicket = false
    //    false면 왼쪽에서 드래그, true면 오른쪽에서 드래그
    @State var direction = false
    
    var body: some View {
        VStack {
            ZStack {
                VStack(spacing:2) {
                   
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.white)
                            .frame(width: 314, height: 514, alignment: .center)
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(LinearGradient(gradient: Gradient(colors: [.purple, ticketViewModel.color]),
                                                     startPoint: .leading, endPoint: .trailing))
                            VStack(alignment:.leading,spacing: 5) {
                                
                                Text(ticketViewModel.partyTitle)
                                    .font(.notoSans(withStyle: .Bold, size: 28))
                                    .foregroundColor(.white)
                                Spacer()
                                    .frame(width: 1, height: 20)
                                Text(ticketViewModel.subTitle)
                                    .font(.notoSans(withStyle: .Bold, size: 24))
                                    .foregroundColor(.white)
                                Spacer()
                                    .frame(width: 1, height: 20)
                                VStack(alignment:.leading,spacing: 3)  {
                                    Text(ticketViewModel.yyyymmdd)
                                        .font(.notoSans(withStyle: .Regular, size: 12))
                                        .foregroundColor(.white)
                                    Text(ticketViewModel.time)
                                        .font(.notoSans(withStyle: .Regular, size: 12))
                                        .foregroundColor(.white)
                                    
                                }
                                Text(ticketViewModel.place)
                                    .font(.notoSans(withStyle: .Regular, size: 12))
                                    .foregroundColor(.white)
                            }.offset(x: -150,y:-50)
                        }.frame(width: 500, height: 300, alignment: .center)
                            .rotationEffect(.degrees(90))
                        
                        Image("mirrorBall")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 158, height: 316, alignment: .leading)
                            .offset(x: -77, y: 73)
                        
                        Triangle()
                            .fill(Color.white)
                            .frame(width: 47, height: 47,alignment: .trailing)
                            .rotationEffect(.degrees(-90))
                            .offset(x: 132, y: 234)
                        
                        Triangle()
                            .fill(Color.black)
                            .frame(width: 35, height: 35,alignment: .trailing)
                            .rotationEffect(.degrees(-90))
                            .offset(x: 140, y: 240)
                    }.frame(width: 136, height: 514, alignment: .center)
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.white)
                        
                        VStack(alignment:.leading,spacing:6) {
                            Text(ticketViewModel.partyTitle)
                                .font(.notoSans(withStyle: .Bold, size: 22))
                                .foregroundColor(.black)
                            Divider().frame(width: 234, height: 1, alignment: .center)
                                .background(Color.black)
                            HStack {
                                VStack(alignment: .leading, spacing: 13) {
                                    Text(timeLabel)
                                        .font(.notoSans(withStyle: .Regular, size: 14))
                                        .foregroundColor(.black)
                                    Text(placeLabel)
                                        .font(.notoSans(withStyle: .Regular, size: 14))
                                        .foregroundColor(.black)
                                }
                                Spacer()
                                    .frame(width: 30, height: 1, alignment: .trailing)
                                Divider().frame(width: 1, height: 39, alignment: .center)
                                    .background(Color.gray)
                                Spacer()
                                    .frame(width: 15, height: 1, alignment: .trailing)
                                VStack(alignment: .leading, spacing: 13) {
                                    Text(ticketViewModel.dateTime)
                                        .font(.notoSans(withStyle: .Regular, size: 14))
                                        .foregroundColor(.black)
                                    Text(ticketViewModel.location)
                                        .font(.notoSans(withStyle: .Regular, size: 14))
                                        .foregroundColor(.black)
                                }
                            }
                        }.padding(EdgeInsets(top: 18, leading: 18, bottom: 18, trailing: 18))
                        
                        Triangle()
                            .fill(Color.black)
                            .frame(width: 35, height: 35,alignment: .trailing)
                            .rotationEffect(.degrees(-180))
                            .offset(x: 140, y: -63)
                        
                    }.frame(width: 314, height: 160, alignment: .center)
                        .offset(x:isTearTicket ? 100 : 0, y: isTearTicket ? 150 : -2)
                        .rotationEffect(.degrees(direction ? (isTearTicket ? 45 : 0) : (isTearTicket ? -45 : 0)))
                        .opacity(isTearTicket ? 0 : 1)
                    
                }.frame(width: 314, height: 161, alignment: .center)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                
                                if gesture.translation.width > 0 {
                                    direction = false
                                    withAnimation(.easeInOut(duration: 0.8)) {
                                        isTearTicket = true
                                    }
                                    
                                } else {
                                    direction = true
                                    withAnimation(.easeInOut(duration: 0.8)) {
                                        isTearTicket = true
                                    }
                                }
                                
                            }
                    )
            }
        }
        
        
        
        
    }
}
