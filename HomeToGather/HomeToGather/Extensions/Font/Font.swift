//
//  Font.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/10.
//

import Foundation
import SwiftUI

extension Font {
    enum Family: String {
        case Bold, Light, Medium, Regular, Thin, Black
    }

    static func notoSans(
      withStyle family: Font.Family,
      size: CGFloat
    ) -> Font {
      return .custom("NotoSansKR-\(family)", size: size)
    }
    
    static func montserrat(
      withStyle family: Font.Family,
      size: CGFloat
    ) -> Font {
      return .custom("Montserrat-\(family)", size: size)
    }
}
