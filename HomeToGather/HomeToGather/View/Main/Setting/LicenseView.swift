//
//  LicenseView.swift
//  HomeToGather
//
//  Created by woo0 on 2022/06/16.
//

import SwiftUI

struct LicenseView: View {
    var openSources: [openSource] = [openSource(openSourceName: "Apple Frameworks", licenseName: "Apple MIT License", url: "https://developer.apple.com/documentation/", copyright: "Copyright Apple lnc."), openSource(openSourceName: "Apple Swift", licenseName: "Apache-2.0 license", url: "https://github.com/apple/swift", copyright: "Copyright Apple lnc. and the Swift project authors"), openSource(openSourceName: "Firebase-ios-sdk", licenseName: "Apache-2.0 license", url: "https://github.com/firebase/firebase-ios-sdk/", copyright: "Copyright Google lnc."), openSource(openSourceName: "Kakao Open SDK", licenseName: "Apache-2.0 license", url: "https://developers.kakao.com/docs", copyright: "Copyright Kakao Corp")]
    var licenses: [license] = [license(licenseName: "Apache-2.0 license", licanseNotice: "ApacheLicense.txt"), license(licenseName: "MIT License", licanseNotice: "MITLicense.txt")]
    var body: some View {
        Text("MIT license | HomeToGather-iOS")
        ScrollView() {
            VStack(alignment: .leading) {
                ForEach(openSources, id: \.self) { openSource in
                    VStack(alignment: .leading) {
                        Text(openSource.openSourceName)
                        Link("\(openSource.url)", destination: URL(string: "\(openSource.url)")!)
                        Text(openSource.copyright)
                            .lineLimit(nil)
                        Text(openSource.licenseName)
                    }
                    .padding(.bottom, 10)
                }
            }
            VStack {
                Text(licenses[0].licenseName)
                Text(readTxtFile(licenses[0].licanseNotice))
                    .frame(height: 5000)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
            }
            .padding(.bottom, 10)
            VStack {
                Text(licenses[1].licenseName)
                Text(readTxtFile(licenses[1].licanseNotice))
                    .frame(height: 900)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
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
