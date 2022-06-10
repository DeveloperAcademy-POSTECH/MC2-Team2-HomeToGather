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
                    QuickSignInWithApple()
                            .frame(width: 280, height: 60, alignment: .center)
                            .onTapGesture {
                                appleLogin()
                            }
                }
            })
    }
    func appleLogin() {
        appleLoginCoordinator = AppleAuthCoordinator(window: window, isSuccess: $isSuccess)
        appleLoginCoordinator?.startAppleLogin()
    }

}
