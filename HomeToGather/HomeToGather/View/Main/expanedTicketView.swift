//
//  expanedTicketView.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/11.
//

import SwiftUI

struct expanedTicketView: View {
    
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
    
    
    
    //    false면 왼쪽에서 드래그, true면 오른쪽에서 드래그
    @State var direction = false
    @Binding var flag: Bool
    
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
                                .fill(LinearGradient(gradient: Gradient(colors: [.purple, Color.init(red: 88/255.0, green: 209/255.0, blue: 255/255.0)]),
                                                     startPoint: .leading, endPoint: .trailing))
                            VStack(alignment:.leading,spacing: 5) {
                                
                                Text(partyName)
                                    .bold()
                                    .font(.system(size:28))
                                    .foregroundColor(.white)
                                Spacer()
                                    .frame(width: 1, height: 20)
                                Text(partySubtitle)
                                    .bold()
                                    .font(.system(size:24))
                                    .foregroundColor(.white)
                                Spacer()
                                    .frame(width: 1, height: 20)
                                VStack(alignment:.leading,spacing: 3)  {
                                    Text(date)
                                        .font(.system(size:12))
                                        .foregroundColor(.white)
                                    HStack(alignment: .center, spacing: 2){
                                        Text(startTime)
                                            .font(.system(size:12))
                                            .foregroundColor(.white)
                                        Text(endTime)
                                            .font(.system(size:12))
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                                Text(location)
                                    .bold()
                                    .font(.system(size:12))
                                    .foregroundColor(.white)
                            }.offset(x: -170,y:-60)
                        }.frame(width: 500, height: 300, alignment: .center)
                            .rotationEffect(.degrees(90))
                        
                        Image("미러볼")
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
                            Text(partyName)
                                .bold()
                                .font(.system(size:16))
                                .foregroundColor(.black)
                            Divider().frame(width: 234, height: 1, alignment: .center)
                                .background(Color.black)
                            HStack {
                                VStack(alignment: .leading, spacing: 13) {
                                    Text(timeLabel)
                                        .font(.system(size:8))
                                        .foregroundColor(.black)
                                    Text(placeLabel)
                                        .font(.system(size:8))
                                        .foregroundColor(.black)
                                }
                                Spacer()
                                    .frame(width: 30, height: 1, alignment: .trailing)
                                Divider().frame(width: 1, height: 39, alignment: .center)
                                    .background(Color.gray)
                                Spacer()
                                    .frame(width: 15, height: 1, alignment: .trailing)
                                VStack(alignment: .leading, spacing: 13) {
                                    Text(month)
                                        .font(.system(size:8))
                                        .foregroundColor(.black)
                                    Text(place)
                                        .font(.system(size:8))
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
