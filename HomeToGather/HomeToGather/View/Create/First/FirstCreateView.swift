//
//  FirstCreateView.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/13.
//

import SwiftUI

struct FirstCreateView: View {
    init()
    {UINavigationBar.appearance().tintColor = .white}
    
    var body: some View {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack{
                        FirstInfo()
                    }
                }
            }
            .navigationBarTitle("초대장 만들기", displayMode: .inline)
//            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing: Button("다음")
                                { /*code*/ } )
        }
    }



