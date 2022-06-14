//
//  PartyData.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/13.
//

import Foundation
import Combine

class PartyData: ObservableObject {
    @Published var rule = [String]()
    @Published var food = [String]()
    @Published var cost = ""
    @Published var title = ""
//    @Published var date = ""
//    @Published var place = ""
//    @Published var description = ""
}
