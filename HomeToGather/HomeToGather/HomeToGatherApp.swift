//
//  HomeToGatherApp.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/09.
//

import KakaoSDKCommon
import SwiftUI
import Firebase

@main
struct HomeToGatherApp: App {
    
    init() {
        FirebaseApp.configure()
        KakaoSDK.initSDK(appKey: "2bd893959bf8ef85a7a905cdd7f47c3b")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//            MainView()
        }
    }
}
