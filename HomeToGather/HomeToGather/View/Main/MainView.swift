//
//  MainView.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/08.
//

import SwiftUI

struct MainView: View {
    @State var isTicketGesture = false
    @State var isTouched = false
    @State var showExpanedTicket = false
    @Binding var isTouchedTicket: Bool
    
    @State var showSettings = false
    @State var isSuccess = false
    
    @ObservedObject var viewModel = ViewModel()
    
    let userID = getUserUid()
    
    init(isTouchedTicket: Binding<Bool>) {
        self._isTouchedTicket = isTouchedTicket
        viewModel.getInvitationsSent(userID)
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            VStack {
                if isTouchedTicket {
                    VStack {
                        ExpanedTicketView(invitation: viewModel.recentInvitation)
                            .padding(.horizontal, 20)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarLeading) {
                                    Button {
                                        withAnimation(.easeInOut(duration:  0.8)) {
                                            isTouchedTicket.toggle()
                                        }
                                    } label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        
                    }
                } else {
                    VStack(spacing: 0) {
                        TicketView(invitation: viewModel.recentInvitation)
                            .padding(.horizontal, 40)
                            .padding(.bottom, 30)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.8)) {
                                    isTouchedTicket.toggle()
                                }
                            }
                        
                        HStack(spacing: 10, content: {
                            NavigationLink {
                                InvitedListView()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.buttonColor)
                                        .frame(width: 170, height: 60)
                                    
                                    Text("초대된 파티")
                                        .font(.notoSans(withStyle: .Bold, size: 17))
                                        .foregroundColor(.white)
                                }
                            }
                            
                            NavigationLink {
                                HostedListView()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.buttonColor)
                                        .frame(width: 170, height: 60)
                                    
                                    Text("주최한 파티")
                                        .font(.notoSans(withStyle: .Bold, size: 17))
                                        .foregroundColor(.white)
                                }
                            }
                            .isDetailLink(false)
                            
                        })
                    }
                }
//                    .preferredColorScheme(.dark)
            }
        }
    }
}
