//
//  ExempleView.swift
//  HomeToGather
//
//  Created by KoJeongseok on 2022/06/13.
//

import SwiftUI

struct ExempleView: View {
    
    @StateObject var partyData = PartyData()
    
    var body: some View {
        SecondCreateView()
            .environmentObject(partyData)
    }
}

struct ExempleView_Previews: PreviewProvider {
    static var previews: some View {
        ExempleView()
    }
}
