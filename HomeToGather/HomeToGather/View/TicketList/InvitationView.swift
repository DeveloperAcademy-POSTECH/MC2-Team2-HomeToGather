//
//  InvitationView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/13.
//

import SwiftUI

struct InvitationView: View {
    var invitationData: Invitation
    
    var body: some View {
        VStack(spacing: 0) {
            InvitedDetailView(invitationData: invitationData)
            
            HStack(spacing: 0) {
                Button(action: {}, label: {
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
                
                Button(action: {}, label: {
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
}
