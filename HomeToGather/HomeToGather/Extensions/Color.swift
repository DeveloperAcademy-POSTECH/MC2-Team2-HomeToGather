//
//  Color.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/10.
//

import Foundation
import SwiftUI

extension Color {
    static let partyRed = Color(hex: "#FF4F4F")
    static let partyGreen = Color(hex: "#4FFFAE")
    static let partyYellow = Color(hex: "FFD250")
    static let partyPurple = Color(hex: "A84FFF")
    static let partyBlue = Color(hex:"54D7FF")
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
