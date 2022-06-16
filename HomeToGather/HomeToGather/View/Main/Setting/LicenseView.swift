//
//  LicenseView.swift
//  HomeToGather
//
//  Created by woo0 on 2022/06/16.
//

import SwiftUI

struct LicenseView: View {
    var openSources: [openSource] = [openSource(openSourceName: "firebase-ios-sdk", licenseName: "Apache-2.0 license", url: "https://github.com/firebase/firebase-ios-sdk/", copyright: "Copyright Google lnc."), openSource(openSourceName: "Apple Frameworks", licenseName: "Apple MIT License", url: "https://developer.apple.com/documentation/", copyright: "Copyright Apple lnc."), openSource(openSourceName: "Apple Swift", licenseName: "Apache-2.0 license", url: "https://github.com/apple/swift", copyright: "Copyright Apple lnc. and the Swift project authors")]
    var licenses: [license] = [license(licenseName: "Apache-2.0 license", licanseNotice: "ApacheLicense.txt"), license(licenseName: "MIT License", licanseNotice: "MITLicense.txt")]
    var body: some View {
        Text("MIT license | HomeToGather-iOS")
        ForEach(openSources, id: \.self) { openSource in
            VStack {
                Text(openSource.openSourceName)
                Link("\(openSource.url)", destination: URL(string: "\(openSource.url)")!)
                Text(openSource.copyright)
                Text(openSource.licenseName)
            }
            .padding(.bottom, 10)
        }
        ForEach(licenses, id: \.self) { license in
            VStack {
                Text(license.licenseName)
                Text(readTxtFile(license.licanseNotice))
            }
            .padding(.bottom, 10)
        }
    }
}

struct LicenseView_Previews: PreviewProvider {
    static var previews: some View {
        LicenseView()
    }
}
