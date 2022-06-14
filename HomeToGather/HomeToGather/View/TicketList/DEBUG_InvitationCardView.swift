//
//  DEBUG_InvitationCardView.swift
//  HomeToGather
//
//  Created by Park Sungmin on 2022/06/13.
//

import SwiftUI

struct DEBUG_InvitationCardView: View {
    let deeplinkManager = DeeplinkManager()
    
    @State var invitationCardData: Invitation?
    
    @State var testCreateLink: String = ""
    
    var body: some View {
        VStack {
            Text(invitationCardData!.id)
            Text(invitationCardData!.date)
            Text(invitationCardData!.place)
            TextField("", text: $testCreateLink)
            
        }
        .onAppear {
            testCreateLink = deeplinkManager.createURL(id: "test").absoluteString
        }
    }
}

//struct DEBUG_InvitationCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        DEBUG_InvitationCardView()
//    }
//}
