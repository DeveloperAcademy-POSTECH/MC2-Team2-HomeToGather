//
//  InvitationView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/13.
//

import SwiftUI
import Firebase
import AuthenticationServices

struct InvitationView: View {
    @Environment(\.window) var window: UIWindow?
    @Environment(\.presentationMode) var presentationMode
    
    @State private var appleLoginCoordinator: AppleAuthCoordinator?
    @State var isSuccess: Bool = Auth.auth().currentUser != nil ? false : true
    
    
    var invitationData: Invitation
    
    var body: some View {
        VStack(spacing: 0) {
            InvitedDetailView(invitationData: invitationData, shoudFeedbackPresented: false)
            
            HStack(spacing: 0) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.cardBackgroundColor)
                            .frame(height: 60)
                        
                        Text("불참")
                            .foregroundColor(.white)
//                            .font(.system(size: 17, weight: .bold))
                            .font(.montserrat(withStyle: .Bold, size: 17))
                    }
                })
                .padding(.trailing, 5)
                
                Button(action: {
                    // 애플 로그인 함수
//                    if isSuccess { appleLogin() }
//                    else {
//                        // 데이터 넘기기
//
//                    }
                    // 참여한다고 데이터 전달하기
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.brandColor)
                            .frame(height: 60)
                        
                        Text("참여")
                            .foregroundColor(.white)
//                            .font(.system(size: 17, weight: .bold))
                            .font(.montserrat(withStyle: .Bold, size: 17))
                    }
                })
                .padding(.leading, 5)

            }
            .padding(20)
        }
    }
    
//    func appleLogin() {
//        appleLoginCoordinator = AppleAuthCoordinator(window: window, isSuccess: $isSuccess, isEnteredWithLink: false, )
//        appleLoginCoordinator?.startAppleLogin()
//    }
}
