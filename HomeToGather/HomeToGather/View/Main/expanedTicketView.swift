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
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @State var placeLabel = "PLACE"
    @State var timeLabel = "TIME"

    @State var isTearTicket = false
    //    false면 왼쪽에서 드래그, true면 오른쪽에서 드래그
    @State var direction = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.white)
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(LinearGradient(gradient: Gradient(colors: [.purple, ticketViewModel.color]), startPoint: .top, endPoint: .bottom))
                    .padding(7)
                
                ZStack() {
                    HStack(spacing: 0) {
                        VStack(spacing: 0) {
                            ZStack {
                                HStack(spacing: 0) {
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(ticketViewModel.partyTitle)
                                            .font(.montserrat(withStyle: .Medium, size: 28))
                                        
                                        Text(ticketViewModel.subTitle)
                                            .font(.montserrat(withStyle: .Medium, size: 24))
                                            .padding(.top, 24)
                                        
                                        Text(ticketViewModel.dateTime)
                                            .font(.montserrat(withStyle: .Medium, size: 12))
                                            .padding(.top, 24)
                                        
                                        Text(ticketViewModel.location)
                                            .font(.montserrat(withStyle: .Medium, size: 12))
                                            .padding(.top, 30)
                                    }
                                }
                            }
                            .padding(10)
                            
                            Spacer()
                        }
                        
                        Spacer()
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
                    Text(ticketViewModel.partyTitle)
                        .foregroundColor(.black)
                        .font(.montserrat(withStyle: .Medium, size: 16))
                        .padding(.bottom, 17)
                    
                    Divider()
                        .frame(width: 250, height: 1)
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
                            Text(ticketViewModel.dateTime)
                                .foregroundColor(.black)
                                .font(.montserrat(withStyle: .Medium, size: 8))
                                .padding(.bottom, 17)
                            
                            Text(ticketViewModel.location)
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
            .offset(x:isTearTicket ? 100 : 0, y: isTearTicket ? 150 : -2)
            .rotationEffect(.degrees(direction ? (isTearTicket ? 45 : 0) : (isTearTicket ? -45 : 0)))
            .opacity(isTearTicket ? 0 : 1)
        }
        .padding(20)
        .preferredColorScheme(.dark)
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
