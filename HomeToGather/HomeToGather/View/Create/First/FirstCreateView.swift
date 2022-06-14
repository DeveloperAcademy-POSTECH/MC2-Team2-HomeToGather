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
            .foregroundColor(.white)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: {
                           SecondCreateView()
                        }, label: {
                           Text("다음")
                                .foregroundColor(.white)
                        })
                    }
                }
        }
    }



