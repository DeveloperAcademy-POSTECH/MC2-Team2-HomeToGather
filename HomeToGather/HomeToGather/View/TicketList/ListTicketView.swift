//
//  ListTicketView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/13.
//

import SwiftUI

struct ListTicketView: View {
    @State var partyTitle = "PARTY TITLE"
    @State var partySubtitle = "SUBTITLE"
    @State var date = "03 / 06 / 22 "
    @State var startTime = "18:00"
    @State var endTime = "23:00"
    @State var location = "D-park House"
    
    @State var partyName = "Party Name"
    @State var placeLabel = "PLACE"
    @State var timeLabel = "TIME"
    @State var month = "JUNE 03"
    @State var place = "서울 서초구 사임당로 130"
    
    @State var isTearTicket = false
    
    var body: some View {
        VStack {
            VStack(spacing: 2) {
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.white)
                        .frame(width: 266, height: 155, alignment: .center)
                        .offset(x: -41)
                    
                    ZStack() {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(LinearGradient(gradient: Gradient(colors: [.purple, Color.init(red: 88/255.0, green: 209/255.0, blue: 255/255.0)]),
                                                 startPoint: .leading, endPoint: .trailing))
                            .frame(width: 259, height: 148)
                            .offset(x: -41)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(partyName)
                                .font(.montserrat(withStyle: .Bold, size: 22))
                                .foregroundColor(.white)
                            
                            Text(partySubtitle)
                                .font(.montserrat(withStyle: .Bold, size: 20))
                                .foregroundColor(.white)
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text(date)
                                    .font(.montserrat(withStyle: .Light, size: 10))
                                    .foregroundColor(.white)
                                
                                HStack(spacing: 2) {
                                    Text(startTime)
                                        .font(.montserrat(withStyle: .Light, size: 10))
                                        .foregroundColor(.white)
                                    
                                    Text(endTime)
                                        .font(.montserrat(withStyle: .Light, size: 10))
                                        .foregroundColor(.white)
                                }
                                
                                Text(location)
                                    .font(.notoSans(withStyle: .Light, size: 10))
                                    .foregroundColor(.white)
                            }
                        }
                        .offset(x: -95, y: -20)
                        
                        Image("미러볼")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 150, alignment: .leading)
                            .rotationEffect(.degrees(-90))
                            .offset(y: -50)
                        
                        Triangle()
                            .fill(Color.white)
                            .frame(width: 30, height: 30,alignment: .trailing)
                            .rotationEffect(.degrees(-45))
                            .offset(x: 92, y: -77)
                        
                        Triangle()
                            .fill(Color.black)
                            .frame(width: 24, height: 24,alignment: .trailing)
                            .rotationEffect(.degrees(-45))
                            .offset(x: 92, y: -78)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.white)
                            .frame(width: 155, height: 83)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(partyName)
                                .font(.montserrat(withStyle: .Bold, size: 14))
                                .foregroundColor(.black)
                            
                            Divider()
                                .frame(width: 134, height: 1)
                                .background(.black)
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(timeLabel)
                                        .font(.montserrat(withStyle: .Light, size: 6))
                                        .foregroundColor(.black)
                                        .padding(.bottom, 8)
                                    
                                    Text(placeLabel)
                                        .font(.montserrat(withStyle: .Light, size: 6))
                                        .foregroundColor(.black)
                                }
                                
                                Divider()
                                    .frame(width: 1, height: 25)
                                    .background(.gray)
                                
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(month)
                                        .font(.montserrat(withStyle: .Light, size: 6))
                                        .foregroundColor(.black)
                                        .padding(.bottom, 8)
                                    
                                    Text(place)
                                        .font(.montserrat(withStyle: .Light, size: 6))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        
                        Triangle()
                            .fill(Color.black)
                            .frame(width: 24, height: 24,alignment: .trailing)
                            .rotationEffect(.degrees(45))
                            .offset(x: 78, y: -38)
                    }
                    .rotationEffect(.degrees(-90))
                    .offset(x: 130)
                    .opacity(isTearTicket ? 0 : 1)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 50, height: 50)
                        .offset(x: 117, y: -53)
                        .opacity(isTearTicket ? 1 : 0)
                }
            }
        }
    }
}

struct ListTicketView_Previews: PreviewProvider {
    static var previews: some View {
        ListTicketView()
            .preferredColorScheme(.dark)
    }
}
