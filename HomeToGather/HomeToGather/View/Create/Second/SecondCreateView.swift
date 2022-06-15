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
    @State private var isDisabled = false
    
    init()
    {UINavigationBar.appearance().tintColor = .white}

    var body: some View {
        ScrollView {
            VStack() {
                
                ProgressBar(num: 2)
                
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
        .navigationBarTitle("초대장 만들기", displayMode: .inline)
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
                NavigationLink(destination: {
                   ColorPickerView()
                        .environmentObject(partyData)
                }, label: {
                    Text("다음")
                        .foregroundColor(isDisabled ? .gray : .white)
                }).disabled(isDisabled)
            }
        }
    }
}
