//
//  ModifyViewModel.swift
//  HomeToGather
//
//  Created by Park Sungmin on 2022/06/16.
//

import Foundation
import SwiftUI
import Combine

class ModifyViewModel: ObservableObject {
    @Published var didMoveToView1: Bool = false
    @Published var didMoveToView2: Bool = false
    @Published var didMoveToView3: Bool = false
    
    init() {
        self.didMoveToView1 = false
        self.didMoveToView2 = false
        self.didMoveToView3 = false
    }
}
