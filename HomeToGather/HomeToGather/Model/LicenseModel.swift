//
//  LicenseModel.swift
//  HomeToGather
//
//  Created by woo0 on 2022/06/16.
//

import SwiftUI

struct openSource: Hashable {
    var openSourceName: String
    var licenseName: String
    var url: String
    var copyright: String
}

struct license: Hashable {
    var licenseName: String
    var licanseNotice: String
}
