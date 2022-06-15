//
//  HostedDetailView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/12.
//

import SwiftUI

struct HostedDetailView: View {
    var hostData: Invitation
    @State private var isConfirmationDialogShow: Bool = false
    @State var viewModel = ViewModel()
    var partyData: PartyData = PartyData()
    
    init(hostData: Invitation) {
        self.hostData = hostData
        self.partyData = PartyData(rule: hostData.rule, food: hostData.food, cost: hostData.cost, title: hostData.title, date: hostData.date, place: hostData.place, description: hostData.description, color: hostData.color, isModifying: true)
    }
    
    private let randomImageName: [String] = ["partyIamge1", "partyImage2", "partyImage3", "partyImage4", "partyImage5"]
    let screenWidth = UIScreen.main.bounds.width
    
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
                                Text(hostData.title)
                                    .font(hostData.title.guessLanguage() == "한국어" ? .notoSans(withStyle: .Bold, size: 24) : .montserrat(withStyle: .Bold, size: 24))
                                    .padding(.top, 18)
                                
                                HStack(spacing: -5) {
                                    if let participants = hostData.participantName {
                                        ForEach(participants, id: \.self) { name in
                                            let indexNum = hostData.participantName?.firstIndex(of: name)
                                            ParticipantView(name: name, indexNum: indexNum ?? 0)
                                        }
                                    }
                                }
                                .padding(.top, 7)
                                
                                HStack(spacing: 0) {
                                    Text("TIME: ")
                                    Text(hostData.date)
                                }
                                .font(.montserrat(withStyle: .Light, size: 14))
                                .padding(.top, 50)
                                
                                HStack(alignment: .top, spacing: 0) {
                                    Text("PLACE: ")
                                    Text(hostData.place)
                                }
                                .font(hostData.place.guessLanguage() == "한국어" ? .notoSans(withStyle: .Light, size: 14) : .montserrat(withStyle: .Light, size: 14))
                                .padding(.bottom, 20)
                            }
                            .padding(20)
                        }
                    }
                    .frame(maxWidth: screenWidth)
                    
                    FeedbackCardView(title: "규칙", contents: hostData.rule, feedbackContents: hostData.ruleFeedback)
                    
                    FeedbackCardView(title: "메뉴", contents: hostData.food, feedbackContents: hostData.foodFeedback)
                    
                    NavigationLink {
                        ModifyView()
                            .environmentObject(partyData)
                    } label: {
                        Image(systemName: "ellipsis.circle.fill")
                    }
                }
                .padding(20)
            }
        }
        .toolbar {
            ToolbarItem {
                Button(role: .destructive, action: {
                    isConfirmationDialogShow = true
                }, label: {
                    Image(systemName: "ellipsis.circle")
                        .foregroundColor(.white)
                })
                .confirmationDialog("confirmationDialog", isPresented: $isConfirmationDialogShow, titleVisibility: .hidden) {
                    Button("공유하기") {}
                    Button("수정하기") {}
                    Button("삭제하기", role: .destructive) {
                        viewModel.deleteInvitation(hostData.id)
                    }
                    Button("취소하기", role: .cancel) {}
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}
