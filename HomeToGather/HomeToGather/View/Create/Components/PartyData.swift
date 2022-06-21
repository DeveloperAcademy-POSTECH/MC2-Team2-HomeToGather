//
//  PartyData.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/13.
//

import Foundation
import Combine

class PartyData: ObservableObject {
    @Published var id = UUID().uuidString
    @Published var rule = [String]()
    @Published var food = [String]()
    @Published var cost = ""
    @Published var title = ""
    @Published var date = ""
    @Published var place = ""
    @Published var description = ""
    @Published var color = "red"
    @Published var isModifying = false
    @Published var hostId = ""
    @Published var isNextView = true
    @Published var ruleItem = ""
    @Published var foodItem = ""
    var participantName: [String]?
    var participantUid: [String]?
    
    init() {}
    
    init(rule: [String], food: [String], cost: String, title: String, date: String, place: String, description: String, color: String, isModifying: Bool, hostId: String, participantName: [String]?, participantUid: [String]?) {
        self.rule = rule
        self.food = food
        self.cost = cost
        self.title = title
        self.date = date
        self.place = place
        self.description = description
        self.color = color
        self.isModifying = isModifying
        self.hostId = hostId
        self.participantUid = participantUid
        self.participantName = participantName
    }
}
