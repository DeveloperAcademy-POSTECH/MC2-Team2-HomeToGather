//
//  SecondModifyView.swift
//  HomeToGather
//
//  Created by Park Sungmin on 2022/06/16.
//

import SwiftUI

struct SecondModifyView: View {
    
    // 툴바 버튼에 이전뷰 전활을 위한 변수
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var partyData: PartyData
    @ObservedObject var modifyViewModel: ModifyViewModel
    
    var body: some View {
        ScrollView {
            VStack() {
                ProgressBar(counter: 50.0)
                RuleView()
                    .padding(.bottom, 20)
                FoodView()
            }
        }
        .onTapGesture {
            hideKeyboard()
            if partyData.cost != "" {
                if Int(partyData.cost) != nil {
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    let result = numberFormatter.string(from: NSNumber(value: Int(partyData.cost)!))
                    partyData.cost = result! + "원"
                }
            }
        }
        .navigationBarTitle("초대장 수정하기", displayMode: .inline)
        .foregroundColor(.white)
        
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                    Text("이전")
                        .padding(.leading, -5)
                })
                .foregroundColor(.white)
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination:
                                ColorPickerModifyView(modifyViewModel: modifyViewModel)
                    .environmentObject(partyData),
                               isActive: self.$modifyViewModel.didMoveToView3)
                {
                    Text("다음")
                        .foregroundColor(isDisabled() ? .gray : .white)
                }
                .isDetailLink(false)
                .onTapGesture {
                    self.modifyViewModel.didMoveToView3 = true
                }
                .disabled(isDisabled())
            }
        }
    }
    func isDisabled() -> Bool {
        if partyData.rule != [String](), partyData.food != [String]() {
            return false
        } else {
            return true
        }
    }
}
