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
    var viewModel = ViewModel()
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
                            
                            Image("mirrorBall")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                            
                            Spacer()
                                .frame(height: 30)
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
                        .frame(height: 1)
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
                .padding(.horizontal)
                
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
            .frame(height: 120)
        }
        .padding(20)
        .frame(minWidth: screenWidth * 3.3/5)
        .frame(maxWidth: screenWidth * 3.7/5)
        .preferredColorScheme(.dark)
    }
}

