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

struct ListTicketView: View {
    var invitationData: Invitation
    
    let screenWidth = UIScreen.main.bounds.width
    
    @State var placeLabel = "PLACE"
    @State var timeLabel = "TIME"
    
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
                            .lineLimit(1)
                        
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
                
                ZStack {
                    HStack(spacing: 0) {
                        Spacer()
                        
                        VStack(spacing: 0) {
                            ZStack(alignment: .bottomLeading) {
                                Triangle()
                                    .fill(Color.white)
                                    .frame(width: 24, height: 24,alignment: .trailing)
                                
                                Triangle()
                                    .fill(Color.black)
                                    .frame(width: 17, height: 17,alignment: .trailing)
                            }
                            .rotationEffect(.degrees(180))
                            
                            Spacer()
                        }
                    }
                }
                .frame(maxWidth: screenWidth, maxHeight: screenWidth)
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.white)
                    .frame(maxWidth: 83, maxHeight: 155)
                
                ZStack {
                    Triangle()
                        .fill(Color.white)
                        .frame(width: 30, height: 30,alignment: .trailing)
                        .rotationEffect(.degrees(-45))
                        .offset(x: -42, y: -77)
                    
                    Triangle()
                        .fill(Color.black)
                        .frame(width: 24, height: 24,alignment: .trailing)
                        .rotationEffect(.degrees(-45))
                        .offset(x: -42, y: -78)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(invitationData.title)
                        .foregroundColor(.black)
                        .font(.montserrat(withStyle: .Medium, size: 14))
                    
                    Divider()
                        .frame(width: 135, height: 1)
                        .background(.black)
                    
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("TIME")
                                .font(.montserrat(withStyle: .Light, size: 6))
                                .foregroundColor(.black)
                                .padding(.bottom, 6)
                            
                            Text("PLACE")
                                .font(.montserrat(withStyle: .Light, size: 6))
                                .foregroundColor(.black)
                        }
                        .padding(.trailing, 6)
                        
                        Divider()
                            .frame(width: 1, height: 25)
                            .background(.gray)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text(invitationData.date)
                                .font(.montserrat(withStyle: .Light, size: 6))
                                .foregroundColor(.black)
                                .padding(.bottom, 6)
                                .lineLimit(1)
                            
                            Text(invitationData.place)
                                .font(.montserrat(withStyle: .Light, size: 6))
                                .foregroundColor(.black)
                                .lineLimit(1)
                        }
                        .padding(.leading, 6)
                    }
                    .padding(.top, 6)
                }
                .frame(width: 83, height: 155)
                .rotationEffect(.degrees(-90))
            }
            .opacity(invitationData.date > Date().toString() ? 1 : 0)
        }
        .frame(height: 155)
        .preferredColorScheme(.dark)
    }
}
