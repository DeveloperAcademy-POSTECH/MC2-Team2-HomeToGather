//
//  PartyData.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/13.
//

//var id = UUID().uuidString      // 초대장 고유 id
//    var uid: String                 // 주최자 id
//    var organizerName: String       // 주최자 이름
//    var participantName: [String]?  // 참여자 이름
//    var participantUid: [String]?   // 참여자 id
//    var title: String               // 파티 이름
//    var date: String                // 파티 일시
//    var place: String               // 파티 장소
//    var description: String         // 파티 소개
//    var rule: [String]              // 파티 규칙
//    var cost: String                // 파티 비용
//    var food: [String]              // 메뉴
//    var etc: [String]               // 기타
//    var image: String = ""          // 이미지
//    var ruleFeedback: [String] = [""] // 규칙 피드백
//    var foodFeedback: [String] = [""] // 메뉴 피드백
//    var color: String               // 초대장 색상

import Foundation
import Combine

class PartyData: ObservableObject {
    @Published var rule = [String]() // 파티 규칙
    @Published var food = [String]() // 메뉴
    @Published var cost = ""         // 파티비용
    @Published var title = ""
//    @Published var date = ""
//    @Published var place = ""
//    @Published var description = ""
}
