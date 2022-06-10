//
//  ContentView.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/09.
//

import SwiftUI
import Firebase
import AuthenticationServices

struct ContentView: View {
    @Environment(\.window) var window: UIWindow?
    @State private var appleLoginCoordinator: AppleAuthCoordinator?
    @State var isSuccess: Bool = Auth.auth().currentUser != nil ? false : true
    
    var body: some View {
        MainView()
            .fullScreenCover(isPresented: $isSuccess, content: {
                VStack {
                    Spacer()
                    Image("LoginViewImage")
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fit)
                        .padding(.horizontal, 17)
                        .padding(.bottom, 140)
                    QuickSignInWithApple()
                        .frame(maxWidth: .infinity)
                        .frame(height: 56, alignment: .center)
                        .onTapGesture {
                            appleLogin()
                        }
                        .padding(.bottom, 60)
                        .padding(.horizontal, 17)
                }
                .background(Color.backgroundColor).ignoresSafeArea()
            })
    }
    func appleLogin() {
        appleLoginCoordinator = AppleAuthCoordinator(window: window, isSuccess: $isSuccess)
        appleLoginCoordinator?.startAppleLogin()
    }

}
