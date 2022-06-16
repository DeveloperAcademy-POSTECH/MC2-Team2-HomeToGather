//
//  TicketViewModel.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/16.
//

import Foundation
import SwiftUI

struct TicketViewModel {
    var invitation: Invitation
    
    var partyTitle: String {
        return invitation.title
    }
    
    var subTitle: String {
        return invitation.description
    }
    
    var yyyymmdd: String {
        return invitation.date.components(separatedBy: " ")[0]
    }
    
    var time: String {
        return invitation.date.components(separatedBy: " ").last!
    }
    
    var place: String {
        return invitation.organizerName
    }
    
    var color: Color {
        return Color.getColor(color: PartyColors.init(rawValue: invitation.color) ?? .red)
    }
    
    var location: String {
        return invitation.place
    }
       
    var dateTime: String {
        return invitation.date
    }
                            
    init(invitation:Invitation){
        self.invitation = invitation
        print("TicketVIewModel: \(invitation)")
    }
    
}
