//
//  InvitedDetailView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/11.
//

import SwiftUI

struct InvitedDetailView: View {
    @State private var buttonText = "doc.on.clipboard"
    
    var invitationData: Invitation
    var shouldFeedbackPresented: Bool
    
    private let randomImageName: [String] = ["partyImage1", "partyImage2", "partyImage3", "partyImage4", "partyImage5"]
    let screenWidth = UIScreen.main.bounds.width
    
    init(invitationData: Invitation, shoudFeedbackPresented: Bool) {
        self.invitationData = invitationData
        self.shouldFeedbackPresented = shoudFeedbackPresented
        print(invitationData)
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.cardBackgroundColor)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Image(randomImageName[Int.random(in: 0..<randomImageName.count)])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 150)
                                .cornerRadius(4)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text(invitationData.title)
                                    .font(invitationData.title.guessLanguage() == "한국어" ? .notoSans(withStyle: .Bold, size: 24) : .montserrat(withStyle: .Bold, size: 24))
                                    .padding(.top, 18)
                                
                                Text(invitationData.description)
                                    .font(invitationData.place.guessLanguage() == "한국어" ? .notoSans(withStyle: .Light, size: 14) : .montserrat(withStyle: .Light, size: 14))
                                    .padding(.top, 6)
                                
                                HStack(spacing: -5) {
                                    if let participants = invitationData.participantName {
                                        ForEach(participants, id: \.self) { name in
                                            if name != "" {
                                                let indexNum = invitationData.participantName?.firstIndex(of: name)
                                                ParticipantView(name: name, indexNum: indexNum ?? 0)
                                            }
                                        }
                                    }
                                }
                                .padding(.top, 14)
                                
                                HStack(spacing: 0) {
                                    Text("TIME: ")
                                    Text(invitationData.date)
                                }
                                .font(.montserrat(withStyle: .Light, size: 14))
                                .padding(.top, 30)
                                
                                HStack(alignment: .top, spacing: 0) {
                                    Text("PLACE: ")
                                    Text(invitationData.place)
                                    
                                    Button(action:{
                                        copyToClipboard()
                                    }, label: {
                                        Image(systemName: buttonText)
                                            .foregroundColor(.white)
                                    })
                                    .padding(.leading, 6)
                                }
                                .font(invitationData.place.guessLanguage() == "한국어" ? .notoSans(withStyle: .Light, size: 14) : .montserrat(withStyle: .Light, size: 14))
                                
                                HStack(spacing: 0) {
                                    Text("COST: ")
                                    Text(invitationData.cost == "" ? "0원" : invitationData.cost)
                                }
                                .font(.montserrat(withStyle: .Light, size: 14))
                                .padding(.bottom, 20)
                            }
                            .padding(20)
                        }
                    }
                    .frame(maxWidth: screenWidth)
                    
                    CardView(title: "규칙", contents: invitationData, shouldFeedbackPresented: shouldFeedbackPresented)
                    
                    CardView(title: "메뉴", contents: invitationData, shouldFeedbackPresented: shouldFeedbackPresented)
                }
                .padding(20)
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func copyToClipboard() {
        UIPasteboard.general.string = invitationData.place
        self.buttonText = "doc.on.clipboard.fill"
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
            self.buttonText = "doc.on.clipboard"
        }
    }
}
