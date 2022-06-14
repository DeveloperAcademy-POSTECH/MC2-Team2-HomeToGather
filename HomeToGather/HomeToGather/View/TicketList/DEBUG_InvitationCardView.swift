//
//  DEBUG_InvitationCardView.swift
//  HomeToGather
//
//  Created by Park Sungmin on 2022/06/13.
//

import SwiftUI
import KakaoSDKLink
import KakaoSDKTemplate
import KakaoSDKCommon

struct DEBUG_InvitationCardView: View {
    let deeplinkManager = DeeplinkManager()
    
    @State var invitationCardData: Invitation?
    
    var body: some View {
        VStack {
            Text(invitationCardData!.id)
            Text(invitationCardData!.date)
            Text(invitationCardData!.place)
            
            Button {
                    kakaoButtonAction()
            } label: {
                Text("링크 공유하기 버튼")
            }
        }
    }
    
    func kakaoButtonAction() -> Void {
        // templatable은 메시지 만들기 항목 참고
        
        let feedTemplateJsonStringData =
            """
            {
                "object_type": "feed",
                "content": {
                    "title": "즐거운 파티에 초대받았어요",
                    "description": "아래 링크를 눌러 파티의 초대장을 확인하고 참여를 알리세요",
                    "image_url": "http://k.kakaocdn.net/dn/bUamiN/btrENVyDbJP/4IY80kN2lbTUeK6CVhVRvK/kakaolink40_original.png",
                    "link": {
                        "mobile_web_url": "https://developers.kakao.com",
                        "web_url": "https://developers.kakao.com",
                        "ios_execution_params": "id=\(invitationCardData!.id)"
                    }
                },
                "buttons": [{
                    "title": "앱에서 초대장 확인하기",
                    "link": {
                        "ios_execution_params": "id=\(invitationCardData!.id)"
                    }
                }]

            }
            """.data(using: .utf8)!
        
        // templatable은 메시지 만들기 항목 참고
        if let templatable = try? SdkJSONDecoder.custom.decode(FeedTemplate.self, from: feedTemplateJsonStringData) {
            LinkApi.shared.defaultLink(templatable: templatable) { linkResult, error in
                if let error = error {
                    print(error)
                }
                else {
                    print("defaultLink() success.")
                    
                    if let linkResult = linkResult {
                        UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                    }
                }
            }
        }
    }
}
