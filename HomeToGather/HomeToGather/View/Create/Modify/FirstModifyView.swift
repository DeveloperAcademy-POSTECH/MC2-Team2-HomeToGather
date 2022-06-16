//
//  ModiftView.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/15.
//

import SwiftUI

struct FirstModifyView: View {
    
    @EnvironmentObject var partyData: PartyData
    
    @Binding var isModified: Bool

    @State private var isDisabled = false
    @Environment(\.dismiss) var dismiss
    
//    init(isModified: Binding<Bool>) {
//        UINavigationBar.appearance().tintColor = .white
//        self._isModified = isModified
//    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ScrollView {
                VStack{
                    FirstInfo()
                        .environmentObject(partyData)
                }
            }
        }
        .navigationBarTitle("초대장 수정하기", displayMode: .inline)
        .foregroundColor(.white)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()

                }, label: {
                    Image(systemName: "chevron.backward")
                    Text("이전")
                        .padding(.leading, -5)
                })
                .foregroundColor(.white)
            }
        }
        
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SecondModifyView(isModified: $isModified).environmentObject(partyData),
                               isActive: $isModified,
                               label: { Text("다음").foregroundColor(isDisabled ? .gray : .white)
                }).disabled(isDisabled)
            }
        }
    }
}



