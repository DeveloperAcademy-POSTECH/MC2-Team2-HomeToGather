//
//  RuleView.swift
//  HomeToGather
//
//  Created by KoJeongseok on 2022/06/14.
//
import SwiftUI

struct RuleView: View {

    @EnvironmentObject var partyData: PartyData
    
    let ruleExample: [String] = ["뒷정리는 가위바위보", "자기가 마실 술은 자기가 사오기", "어메니티 제공됨", "일찍 집가기 금지", "방음에 약하니 노래부르기 금지", "쓸데없는데 재밌는 선물 사오기"]
    



    let size: CGFloat = UIScreen.main.bounds.width - 40

    var body: some View {

            VStack(alignment: .leading, spacing: 20) {
                TitleRow(text: "홈파티 규칙")
                    .padding(EdgeInsets(top: 65, leading: 20, bottom: 36, trailing: 0))

                AddListView(lists: $partyData.rule, item: $partyData.ruleItem, examples: ruleExample,  text: "홈파티 규칙을 작성해주세요.", placeholder: "ex)뒷정리는 가위바위보")
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                

                CostView( cost: $partyData.cost)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 53, trailing: 20))
                    
            }
        .frame(width: size)
        .background(Color.cardBackgroundColor)
        .cornerRadius(4)
    }

}
