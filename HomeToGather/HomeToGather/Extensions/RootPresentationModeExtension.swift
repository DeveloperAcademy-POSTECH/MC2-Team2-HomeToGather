//
//  RootPresentationExtension.swift
//  HomeToGather
//
//  Created by Park Sungmin on 2022/06/17.
//

import SwiftUI

struct RootPresentationModeKey: EnvironmentKey {
  static let defaultValue: Binding<RootPresentationMode> = .constant(RootPresentationMode())
}

extension EnvironmentValues {
  var rootPresentationMode: Binding<RootPresentationMode> {
    get { return self[RootPresentationModeKey.self] }
    set { self[RootPresentationModeKey.self] = newValue }
  }
}

typealias RootPresentationMode = Bool

public extension RootPresentationMode {
  mutating func dismissRoot() {
    self = false
  }
}


