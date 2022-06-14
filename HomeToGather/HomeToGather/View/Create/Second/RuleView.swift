//
//  RuleView.swift
//  HomeToGatherEX
//
//  Created by KoJeongseok on 2022/06/10.
//

import SwiftUI

struct RuleView: View {
    
    @EnvironmentObject var partyData: PartyData
    

    
    let size: CGFloat = UIScreen.main.bounds.width - 40
    
    var body: some View {

            VStack(alignment: .leading, spacing: 20) {
                TitleRow(text: "홈파티 규칙")
                    .padding(.top, 20)
                    .padding(.leading, 20)
                
                AddListView(lists: $partyData.rule, text: "홈파티 규칙을 작성해주세요.", placeholder: "ex)뒷정리는 가위바위보로")
                    .padding(20)
                
                CostView( cost: $partyData.cost)
                    .padding(20)
            }
        .frame(width: size)
        .background(Color(.gray))
        .cornerRadius(4)
//        .padding(20)
        
    }
    
}


