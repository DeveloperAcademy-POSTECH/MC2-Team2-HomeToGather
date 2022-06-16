//
//  SettingDetailView.swift
//  HomeToGather
//
//  Created by woo0 on 2022/06/11.
//

import SwiftUI

struct SettingDetailView: View {
    @State var title: String
    var body: some View {
        Text("\(title)")
    }
}

struct SettingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SettingDetailView(title: "?")
    }
}
