//
//  FirstModifyView.swift
//  HomeToGather
//
//  Created by Park Sungmin on 2022/06/17.
//


import SwiftUI

struct FirstModifyView: View {

    
    @EnvironmentObject var partyData: PartyData
    @State private var isDisabled = false
    @Environment(\.dismiss) var dismiss
    @Binding var changeData : Bool
    
    init(changeData: Binding<Bool>){
        UINavigationBar.appearance().tintColor = .white
        self._changeData = changeData
    }
    
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
                    print("PartyDataReset")
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
                NavigationLink(destination: {
                    SecondModifyView(changeData: $changeData)
                        .environmentObject(partyData)
                }, label: {
                    Text("다음")
                        .foregroundColor(isDisabled ? .gray : .white)
                })
                .isDetailLink(false)
                .disabled(isDisabled)
            }
        }
    }
}



