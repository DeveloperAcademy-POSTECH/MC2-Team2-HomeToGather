//
//  ListView.swift
//  HomeToGather
//
//  Created by KoJeongseok on 2022/06/14.
//
import SwiftUI


struct ListView: View {

    @EnvironmentObject var partyData: PartyData

    @Binding var lists: [String]
    @Binding var item: String
    var text: String
    var index: Int

    var body: some View {
        HStack {
            Text("•")
            Text(text)
                .font(.notoSans(withStyle: .Light, size: 16))
            Spacer()
            Button(action: {
                lists.remove(at: index)
                print((lists))
            }, label: {
                Image(systemName: "minus.square")
                    .foregroundColor(.white)
            })
        }
    }
}
