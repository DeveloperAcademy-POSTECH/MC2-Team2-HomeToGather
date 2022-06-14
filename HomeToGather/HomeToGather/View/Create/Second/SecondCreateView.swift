
//  CreateView.swift
//  HomeToGatherEX
//
//  Created by KoJeongseok on 2022/06/10.
//

import SwiftUI

struct SecondCreateView: View {
    @EnvironmentObject var partyData: PartyData
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
//
//            ProgressBar(num: 2)
//                .padding(.leading, 40)
//
//
            ZStack {
                ScrollView {
                    VStack(alignment: .center, spacing: 22) {
//                        RuleView()
                            

//                        FoodView()
                    }
                }
            }
            .onTapGesture {
//                hideKeyboard()
                if partyData.cost != "" {
                    if Int(partyData.cost) != nil {
                        let numberFormatter = NumberFormatter()
                        numberFormatter.numberStyle = .decimal
                        let result = numberFormatter.string(from: NSNumber(value: Int(partyData.cost)!))
                        partyData.cost = result! + "원"
                    }
                }
            }
        }
    }
}
