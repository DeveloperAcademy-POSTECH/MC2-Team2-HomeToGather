//
//  View.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/11.
//

import Foundation
import SwiftUI

extension View {
    func placeholder<Content: View>(when shouldShow: Bool, aligment: Alignment = .leading, @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: aligment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
