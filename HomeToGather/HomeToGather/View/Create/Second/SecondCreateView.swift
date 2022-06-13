
//  CreateView.swift
//  HomeToGatherEX
//
//  Created by KoJeongseok on 2022/06/10.
//

import SwiftUI

struct SecondCreateView: View {
    @EnvironmentObject var partyData: PartyData
    var body: some View {
        
        ZStack {
            ScrollView {
                VStack {
                    RuleView()

                    FoodView()
                }
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
    }
}
