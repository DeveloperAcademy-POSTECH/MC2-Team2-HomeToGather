//
//  PartyData.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/13.
//

import Foundation
import Combine

class PartyData: ObservableObject {
    @Published var ruleLists = [String]()
    @Published var foodLists = [String]()
    @Published var title = ""
//    @Published var date = ""
//    @Published var place = ""
//    @Published var description = ""
}
