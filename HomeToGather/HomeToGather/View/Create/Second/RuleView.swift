//
//  RuleView.swift
//  HomeToGather
//
//  Created by KoJeongseok on 2022/06/14.
//
import SwiftUI

struct RuleView: View {

    @EnvironmentObject var partyData: PartyData



    let size: CGFloat = UIScreen.main.bounds.width - 40

    var body: some View {

            VStack(alignment: .leading, spacing: 20) {
                TitleRow(text: "홈파티 규칙")
                    .padding(EdgeInsets(top: 65, leading: 20, bottom: 36, trailing: 0))

                AddListView(lists: $partyData.rule, text: "홈파티 규칙을 작성해주세요.", placeholder: "ex)뒷정리는 가위바위보로")
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))


                CostView( cost: $partyData.cost)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 53, trailing: 20))
                    
            }
        .frame(width: size)
        .background(Color.cardBackgroundColor)
        .cornerRadius(4)
    }

}
