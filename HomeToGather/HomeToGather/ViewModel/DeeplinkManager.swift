//
//  DeeplinkManager.swift
//  HomeToGather
//
//  Created by Park Sungmin on 2022/06/13.
//

import Foundation
import FirebaseDynamicLinks
import KakaoSDKLink
import KakaoSDKTemplate
import KakaoSDKCommon

class DeeplinkManager {
    
    // 링크를 통해 앱이 열렸을 때, 앱이 어디로 갈 지에 대해 목적지를 enum 타입으로 관리
    enum DeeplinkTarget: Equatable {
        case main
        case invitation(id: String)
    }
    
    // URL의 유효성과 데이터를 받아들일 함수
    // 앱 링크 형식은 적절하지만, 유효하지 않은 링크라면 메인 뷰를 호출
    // id 값을 통해 적절한 초대장 뷰를 호출
    func getDeeplinkTarget(url: URL) -> DeeplinkTarget {
        var invitationId: String = ""
        
        // URL 가져오기
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        // URL에 'invitation'이 포함되어 있지 않으면 main으로 가도록 타겟 반환
        // 'invitation'이 포함되어 있다면 유효한 초대장 링크라고 판단
        if components!.string!.contains("id=") == false {
            return .main
        }
        
        // 가져온 링크의 쿼리 중 "id" 항목에서  invitationId를 추출해내기
        let queryItems = components!.queryItems
                
        for item in queryItems! {
            print("query : \(item.value ?? "")")
            if item.name == "id" {
                invitationId = item.value!
                break
            }
        }
        
        // 링크를 통해 가져온 초대장 id와 함께, 타겟으로 초대장을 반환함
        print("Deeplink_Debug : Link를 통해 가져온 InvitationID : \(invitationId)")
        return .invitation(id: invitationId)
    }
    
    
    // 초대장 ID를 사용해 카카오톡 초대 링크 생성하고 카카오톡 앱 호출
    func shareLinkToKakao(invitationID: String) {
        
        // 피드 형태의 템플릿 정의
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
                        "ios_execution_params": "id=\(invitationID)"
                    }
                },
                "buttons": [{
                    "title": "앱에서 초대장 확인하기",
                    "link": {
                        "ios_execution_params": "id=\(invitationID)"
                    }
                }]

            }
            """.data(using: .utf8)!
        
        // 템플릿을 바탕으로 링크 생성 및 카카오톡 앱 호출
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
