//
//  SearchAddressButton.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/13.
//

import SwiftUI

struct SearchAddressButton: View {
    @State private var showModal = false
    @State private var mainAddress = "주소를 검색해주세요."
    
    var body: some View {
        HStack{
            Button(action: {
                self.showModal = true
            },label: {
                Image(systemName: "magnifyingglass.circle.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 17))
                Text("\(mainAddress)")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .light))
            }                    )
            .sheet(isPresented: self.$showModal) {
                AdressWebView(urlToLoad: "https://junghoon-p.github.io/Kakao-Postcode/")
            }
        }
    }
}
