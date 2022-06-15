//
//  Jouney.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/13.
//

import SwiftUI

struct SecondCreateView: View {
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
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: {
                   ColorPickerView()
                }, label: {
                    Text("다음")
                        .foregroundColor(isDisabled ? .gray : .white)
                }).disabled(isDisabled)
            }
        }
    }
}
