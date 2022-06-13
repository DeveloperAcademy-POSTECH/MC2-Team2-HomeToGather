//
//  TitleRow.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/13.
//

import SwiftUI

struct TitleRow: View {
    var text: String
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 7.5)
                .frame(width: 135, height: 15)
                .foregroundColor(Color.purple)
                .padding(.top, 10)
            
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 24))
                .bold()
        }
    }
}
