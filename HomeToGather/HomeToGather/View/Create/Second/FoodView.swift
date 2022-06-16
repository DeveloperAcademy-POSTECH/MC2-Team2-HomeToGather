//
//  FoodView.swift
//  HomeToGather
//
//  Created by KoJeongseok on 2022/06/14.
//

import SwiftUI

struct FoodView: View {

    @EnvironmentObject var partyData: PartyData

    let size: CGFloat = UIScreen.main.bounds.width - 40

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TitleRow(text: "홈파티 음식")
                .padding(EdgeInsets(top: 65, leading: 20, bottom: 36, trailing: 0))

            AddListView(lists: $partyData.food, item: $partyData.foodItem ,text: "홈파티 음식 리스트를 적어주세요.", placeholder: "ex)감바스")
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 53, trailing: 20))

        }
    .frame(width: size)
    .background(Color.cardBackgroundColor)
    .cornerRadius(4)
    }
}
