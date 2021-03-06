//
//  Jouney.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/13.
//

import SwiftUI

struct SecondCreateView: View {
    
    // 툴바 버튼에 이전뷰 전활을 위한 변수
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var partyData: PartyData
    
    init()
    {UINavigationBar.appearance().tintColor = .white}

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
            if partyData.ruleItem != "" {
                partyData.rule.append(partyData.ruleItem)
                partyData.ruleItem = ""
            }
            if partyData.foodItem != "" {
                partyData.food.append(partyData.foodItem)
                partyData.foodItem = ""
            }
            
            
            
            if partyData.cost != "" {
                if Int(partyData.cost) != nil {
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    let result = numberFormatter.string(from: NSNumber(value: Int(partyData.cost)!))
                    partyData.cost = result! + "원"
                }
            }
            
            
            
        }
        .navigationBarTitle("초대장 만들기", displayMode: .inline)
        .foregroundColor(.white)
        
        .navigationBarBackButtonHidden(true)
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
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: {
                   ColorPickerView()
                        .environmentObject(partyData)
                }, label: {
                    Text("다음")
                        .foregroundColor(isDisabled() ? .gray : .white)
                }).disabled(isDisabled())
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
