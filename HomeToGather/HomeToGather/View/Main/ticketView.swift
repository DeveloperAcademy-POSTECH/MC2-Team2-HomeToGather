//
//  ticketView.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/08.
//

import SwiftUI

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
    
    init(invitation: Invitation) {
        self.ticketViewModel = TicketViewModel(invitation: invitation)
    }
    
    @State var placeLabel = "PLACE"
    @State var timeLabel = "TIME"
    
    var body: some View {
        VStack {
            
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea( edges: .all)
                
                VStack(spacing:2) {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.white)
                            .frame(width: 270, height: 400, alignment: .center)
                        
                        ZStack(alignment: .topLeading) {
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(LinearGradient(gradient: Gradient(colors: [.purple,ticketViewModel.color]),
                                                     startPoint: .leading, endPoint: .trailing))
                            
                            VStack(alignment:.leading,spacing: 5) {
                                
                                Text(ticketViewModel.partyTitle)
                                    .font(.notoSans(withStyle: .Medium, size: 28))
                                    .foregroundColor(.white)
                                
                                Text(ticketViewModel.subTitle)
                                    .font(.notoSans(withStyle: .Medium, size: 24))
                                    .foregroundColor(.white)
                                
                                VStack(alignment:.leading,spacing: 3)  {
                                    Text(ticketViewModel.yyyymmdd)
                                        .font(.system(size:12))
                                        .foregroundColor(.white)
                                    
                                    Text(ticketViewModel.time)
                                        .font(.system(size:12))
                                        .foregroundColor(.white)
                                    
                                }
                                Text(ticketViewModel.place)
                                    .bold()
                                    .font(.system(size:12))
                                    .foregroundColor(.white)
                            }.offset(x: -100,y:-40)
                        }.frame(width: 388, height: 258, alignment: .center)
                            .rotationEffect(.degrees(90))
                        
                        Image("mirrorBall")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 135, height: 253, alignment: .leading)
                            .offset(x: -65, y: 65)
                        Triangle()
                            .fill(Color.white)
                            .frame(width: 30, height: 30,alignment: .trailing)
                            .rotationEffect(.degrees(-90))
                            .offset(x: 120, y: 180)
                        Triangle()
                            .fill(Color.black)
                            .frame(width: 24, height: 24,alignment: .trailing)
                            .rotationEffect(.degrees(-90))
                            .offset(x: 123, y: 188)
                    }.frame(width: 270, height: 400, alignment: .center)
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.white)
                        
                        VStack(alignment:.leading,spacing:6) {
                            Text(ticketViewModel.partyTitle)
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
                                    Text(ticketViewModel.dateTime)
                                        .font(.system(size:8))
                                        .foregroundColor(.black)
                                    Text(ticketViewModel.location)
                                        .font(.system(size:8))
                                        .foregroundColor(.black)
                                }
                            }
                        }.padding(EdgeInsets(top: 18, leading: 18, bottom: 18, trailing: 18))
                        Triangle()
                            .fill(Color.black)
                            .frame(width: 24, height: 24,alignment: .trailing)
                            .rotationEffect(.degrees(-180))
                            .offset(x: 125, y: -42)
                        
                    }.frame(width: 270, height: 70, alignment: .center)
                }.frame(width: 260, height: 472, alignment: .center)
                
            }
            
        }
        
    }
}
