//
//  SettingView.swift
//  HomeToGather
//
//  Created by woo0 on 2022/06/11.
//

import SwiftUI
import Firebase
import AuthenticationServices

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var isSuccess: Bool
    @State var RelatedInformationList: [String] = ["개인정보 정책","오픈소스","이용약관"]
    
    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("< 메인")
                .foregroundColor(Color.white)
        }
    }
    
    var body: some View {
        VStack {
//            List {
//                NavigationLink(destination: {
//                    SettingDetailView(title: RelatedInformationList[0])
//                }, label: {
//                    Text("\(RelatedInformationList[0])")
//                })
//                .listRowSeparator(.hidden, edges: .top)
//                NavigationLink(destination: {
//                    SettingDetailView(title: RelatedInformationList[1])
//                }, label: {
//                    Text("\(RelatedInformationList[1])")
//                })
//                NavigationLink(destination: {
//                    SettingDetailView(title: RelatedInformationList[2])
//                }, label: {
//                    Text("\(RelatedInformationList[2])")
//                })
//            }
//            .listStyle(.plain)
//            .padding(.bottom, 30)
            List {
                Text("버전 정보")
                    .badge(Text("최신 버전"))
                    .listRowSeparator(.hidden, edges: .top)
                Button(action: {
                    try! Auth.auth().signOut()
                    self.presentationMode.wrappedValue.dismiss()
                    isSuccess = true
                }, label: {
                    Text("로그아웃")
                })
                
            }
            .listStyle(.plain)
        }
        .frame(height: 330)
        .navigationBarTitle("설정", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        Spacer()
    }
}

