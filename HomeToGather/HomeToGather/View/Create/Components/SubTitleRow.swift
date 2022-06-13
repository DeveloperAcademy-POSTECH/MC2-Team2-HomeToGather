//
//  SubTitleRow.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/13.
//

import SwiftUI

struct SubTitleRow: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .light))
            
    }
}
