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

extension String {
    func guessLanguage() -> String {
        let length = self.utf16.count
        let languageCode = CFStringTokenizerCopyBestStringLanguage(self as CFString, CFRange(location: 0, length: length)) as String? ?? ""

        let locale = Locale(identifier: languageCode)
        return locale.localizedString(forLanguageCode: languageCode) ?? "Unknown"
    }
}
