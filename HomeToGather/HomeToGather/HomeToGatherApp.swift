//
//  HomeToGatherApp.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/09.
//

import SwiftUI
import Firebase

@main
struct HomeToGatherApp: App {
    @StateObject var partyData = PartyData()
    
    @StateObject var partyData = PartyData()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(partyData)
        }
    }
}
