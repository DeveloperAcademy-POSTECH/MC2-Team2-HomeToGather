//
//  LicenseViewModel.swift
//  HomeToGather
//
//  Created by woo0 on 2022/06/16.
//

import SwiftUI

func readTxtFile(_ name: String) -> String {
    var result = ""
    
    let paths = Bundle.main.path(forResource: "\(name)", ofType: nil)
    guard paths != nil else { return "" }
    
    do {
        result = try String(contentsOfFile: paths!, encoding: .utf8)
    }
    catch let error as NSError {
        print("catch :: ", error.localizedDescription)
        return ""
    }
    
    return result
}
