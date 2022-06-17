//
//  SwiftUIView.swift
//  HomeToGather
//
//  Created by Park Sungmin on 2022/06/17.
//

import SwiftUI

struct SecondModifyView: View {
    
    // 툴바 버튼에 이전뷰 전활을 위한 변수
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var partyData: PartyData
    @Binding var changeData : Bool
    
    @State var isDone: Bool = false
    
    init(changeData: Binding<Bool>)
    {
        UINavigationBar.appearance().tintColor = .white
        self._changeData = changeData
    }
    
    var body: some View {
        ZStack {
            NavigationLink(isActive: $isDone) {
                ColorPickerModifyView(changeData: $changeData)
                    .environmentObject(partyData)
            } label: {
                EmptyView()
            }
            .isDetailLink(false)
            
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
            .navigationBarTitle("초대장 수정하기", displayMode: .inline)
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
                    
                    Button {
                        self.isDone.toggle()
                    } label: {
                        Text("다음")
                            .foregroundColor(isDisabled() ? .gray : .white)
                    }
                    .disabled(isDisabled())}
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
