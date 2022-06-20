//
//  ColorPickerModifyView.swift
//  HomeToGather
//
//  Created by Park Sungmin on 2022/06/17.
//

import SwiftUI

struct ColorPickerModifyView: View {
    
    @State private var selectedColor = PartyColors.red
    
    @State private var viewModel = ViewModel()
    @EnvironmentObject var partyData: PartyData
    @Environment(\.dismiss) var dismiss
    
    @Binding var changeData : Bool
    
    init(changeData: Binding<Bool>) {
        self._changeData = changeData
        viewModel.getUserName(getUserUid())
    }
    
    var body: some View {
        ProgressBar(counter: 100.0)
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack(spacing:0){
                HStack {
                    ForEach(PartyColors.allCases,id:\.self) { color in
                        ColorView(color: color, selectedColor: $selectedColor)
                            .onTapGesture {
                                selectedColor = color
                                partyData.color = color.rawValue
                            }
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: 13, leading: 20, bottom: 22, trailing: 20))
                .background(Color.backgroundColor)
                
                TicketView(invitation: Invitation(id: partyData.id, uid: getUserUid(), organizerName: viewModel.userName, title: partyData.title, date: partyData.date, place: partyData.place, description: partyData.description, rule: partyData.rule, cost: partyData.color, food: partyData.food, etc: [], color: partyData.color))
                    .padding(.horizontal, 70)
                
                Button {
                    if !partyData.isModifying {
                        viewModel.uploadInvitation(Invitation(id: partyData.id, uid: getUserUid(), organizerName: viewModel.userName, title: partyData.title, date: partyData.date, place: partyData.place, description: partyData.description, rule: partyData.rule, cost: partyData.cost, food: partyData.food, etc: [""], color: partyData.color))
                    } else {
                        viewModel.correctionInvitation(Invitation(id: partyData.id, uid: getUserUid(), organizerName: viewModel.userName, participantName: partyData.participantName, participantUid: partyData.participantUid, title: partyData.title, date: partyData.date, place: partyData.place, description: partyData.description, rule: partyData.rule, cost: partyData.cost, food: partyData.food, etc: [""], color: partyData.color), partyData.hostId)
                    }
                    
                    if partyData.isModifying {
                        print("DEBUG : 수정하기")
                        self.changeData.toggle()
                    }
                } label: {
                    Text(partyData.isModifying ? "수정하기" : "만들기")
                        .font(.system(size: 18))
                }.frame(width: 350, height: 50, alignment: .center)
                    .background(Color.partyPurple)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .navigationBarTitle("초대장 테마 설정", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .foregroundColor(.white)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    partyData.isNextView = false
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                    Text("이전")
                        .padding(.leading, -5)
                })
                .foregroundColor(.white)
            }
        }
    }
}
