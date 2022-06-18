//
//  RuleView.swift
//  HomeToGather
//
//  Created by KoJeongseok on 2022/06/14.
//
import SwiftUI

struct RuleView: View {

    @EnvironmentObject var partyData: PartyData
    
    let ruleExample: [String] = ["뒷정리는 가위바위보", "설거지는 게임으로 정하기", "어메니티 제공", "지각하면 엉덩이로 이름쓰기"]
    



    let size: CGFloat = UIScreen.main.bounds.width - 40

    var body: some View {

            VStack(alignment: .leading, spacing: 20) {
                TitleRow(text: "홈파티 규칙")
                    .padding(EdgeInsets(top: 65, leading: 20, bottom: 36, trailing: 0))

                AddListView(lists: $partyData.rule, item: $partyData.ruleItem, examples: ruleExample,  text: "홈파티 규칙을 작성해주세요.", placeholder: "ex)뒷정리는 가위바위보로")
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                

                CostView( cost: $partyData.cost)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 53, trailing: 20))
                    
            }
        .frame(width: size)
        .background(Color.cardBackgroundColor)
        .cornerRadius(4)
    }

}
