//
//  ListView.swift
//  HomeToGatherEX
//
//  Created by KoJeongseok on 2022/06/11.
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
            Spacer()
            Button(action: {
                lists.remove(at: index)
                print((lists))
            }, label: {
                Image(systemName: "minus.circle")
                    .foregroundColor(.white)
            })
        }
    }
}
