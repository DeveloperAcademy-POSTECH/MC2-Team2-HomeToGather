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
                .padding(.top, 20)
                .padding(.leading, 20)

            AddListView(lists: $partyData.food,text: "홈파티 음식 리스트를 적어주세요.", placeholder: "ex)감바스")
                .padding(20)

        }
    .frame(width: size)
    .background(Color(.gray))
    .cornerRadius(4)
//    .padding(20)
    }
}
