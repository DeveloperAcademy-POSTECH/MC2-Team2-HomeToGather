//
//  HostedPresentationModeExtension.swift
//  HomeToGather
//
//  Created by Park Sungmin on 2022/06/16.
//

import SwiftUI

struct HostedPresentationModeKey: EnvironmentKey {
  static let defaultValue: Binding<HostedPresentationMode> = .constant(HostedPresentationMode())
}

extension EnvironmentValues {
  var hostedPresentationMode: Binding<HostedPresentationMode> {
    get { return self[HostedPresentationModeKey.self] }
    set { self[HostedPresentationModeKey.self] = newValue }
  }
}

typealias HostedPresentationMode = Bool

public extension HostedPresentationMode {
  mutating func dismissHosted() {
    self.toggle()
  }
}
