//
//  DeeplinkManager.swift
//  HomeToGather
//
//  Created by Park Sungmin on 2022/06/13.
//

import Foundation
import FirebaseDynamicLinks

class DeeplinkManager {
    
    // 링크를 통해 앱이 열렸을 때, 앱이 어디로 갈 지에 대해 목적지를 enum 타입으로 관리
    enum DeeplinkTarget: Equatable {
        case main
        case invitation(id: String)
    }
    
    // URL의 유효성과 데이터를 받아들일 함수 생성
    // 앱 링크 형식은 적절하지만, 유효하지 않은 링크라면 메인 뷰를 띄움
    // id 값을 통해 적절한 초대장 뷰를 불러올 수 있음
    func manage(url: URL) -> DeeplinkTarget {
        var invitationId: String = ""
        
        // URL 가져오기
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        // URL에 'invitation'이 포함되어 있지 않으면 main으로 가도록 타겟 반환
        // 'invitation'이 포함되어 있다면 유효한 초대장 링크라고 판단
        if components!.string!.contains("invitation") == false {
            return .main
        }
        
        // 가져온 링크의 쿼리 중 "id=" 이 포함되어 있는 항목에서 invitationId를 추출해내기
        let queryItems = components!.queryItems
        print(queryItems)
        
        invitationId = queryItems![0].value!
        
        for item in queryItems! {
            print("query : \(item.value)")
            if(item.value!.contains("id=")) {
                let range = item.value!.range(of: "id=")

                let endWordIndex = item.value![range!].endIndex
                invitationId = String(item.value![endWordIndex ..< item.value!.endIndex])

                break
            }
        }
        
        // 링크를 통해 가져온 초대장 id와 함께, 타겟으로 초대장을 반환함
        print("Deeplink_Debug : Link를 통해 가져온 InvitationID : \(invitationId)")
        return .invitation(id: invitationId)
    }
    
    
    // 공유를 위한 URL 생성
    // 링크는 https://*App_Domain*.page.link/invitation?id=*Invitation_Card_ID* 의 형태로 생성되어 반환됨
    func createURL(id: String) -> URL{

// ********************************
//      앱스토어 ID 추가해주어야 함
        
        let dynamicLinksDomainURIPrefix = "https://hometogather.page.link"
        let link = URL(string: "/invitation?id=\(id)")!
        let linkBuilder = DynamicLinkComponents(link: link, domainURIPrefix: dynamicLinksDomainURIPrefix)


        linkBuilder!.iOSParameters = DynamicLinkIOSParameters(bundleID: "com.doyun.HomeToGather")
        linkBuilder!.iOSParameters?.appStoreID = "100000"
        
//        안드로이드 대응을 위한 파라미터
//        linkBuilder!.androidParameters = DynamicLinkAndroidParameters(packageName: "com.xxx.xxxandroid")
        
//        링크 상세 설정(제목,이미지)
//        링크에 SNS를 통해 공유할 때 함께 생성될 디테일 정보를 파라미터로 추가할 수 있음
//        linkBuilder!.socialMetaTagParameters = DynamicLinkSocialMetaTagParameters()
//        linkBuilder!.socialMetaTagParameters?.title = "저의 홈파티에 초대합니다!"
//        linkBuilder!.socialMetaTagParameters?.imageURL = URL(string: "https://www.hankyung.com/economy/article/201809145531g")
        
        // 긴 URL 생성됨
        var createdDynamicLink = linkBuilder!.url!
        
        // 아래를 거치면 조금 더 짧은 URL 생성할 수 있음
        linkBuilder!.shorten() { url, warnings, error in
            guard let url = url, error == nil else { return }
            
            createdDynamicLink = url
        }
        
        return createdDynamicLink
    }
}
