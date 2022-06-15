//
//  Color.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/10.
//

import Foundation
import SwiftUI

extension Color {
    
//    티켓 색상 선택하는 함수
    static func getColor(color:PartyColors) -> Color {
        switch color {
        case .blue : return Color(hex:"54D7FF")
        case .yellow : return Color(hex: "FFD250")
        case .green : return Color(hex: "#4FFFAE")
        case .red : return Color(hex: "#FF4F4F")
        }
    }
    
    static let partyRed = Color(hex: "#FF4F4F")
    static let partyGreen = Color(hex: "#4FFFAE")
    static let partyYellow = Color(hex: "FFD250")
    static let partyPurple = Color(hex: "A84FFF")
    static let partyBlue = Color(hex:"54D7FF")
    
    
    static let backgroundColor = Color(hex: "#0B0019")
    static let brandColor = Color(hex: "#A84FFF")
    static let cardBackgroundColor = Color(hex: "1D1C1D")
    static let card1Color = Color(hex: "#FC9467")
    static let card2Color = Color(hex: "#FFD250")
    static let card3Color = Color(hex: "#54D7FF")
    static let borderColor = Color(hex: "494949")
    static let buttonColor = Color(hex:"1e1e1e")
    static let placeholderColor = Color(hex: "#5B5A5F")
    
}
extension Color {
    
//    #빼도 가능!
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
      }
}
