//
//  HideKeyboard.swift
//  HomeToGather
//
//  Created by KoJeongseok on 2022/06/13.
//
import SwiftUI

// 키보드 자동으로 비활성화 기능: hideKeyboard()로 키보드 비활성화
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
