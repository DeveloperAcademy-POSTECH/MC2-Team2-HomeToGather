//
//  AdressWebView.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/13.
//

import SwiftUI
import WebKit

struct AdressWebView: UIViewRepresentable {
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var urlToLoad: String
    
    //ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        //unwrapping
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        //웹뷰 인스턴스 생성
        let webView = WKWebView()
        
        //웹뷰를 로드한다
        webView.load(URLRequest(url: url))
        return webView
    }
    
    //업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<AdressWebView>) {
        
    }
    
//    func makeCoordinator() -> AdressWebView.Coordinator {
//        return AdressWebView.Coordinator(self)
//    }
    
//    class Coordinator: NSObject {
//
//        var addressWebView: AdressWebView // SwiftUi View
//
//        init(_ addressWebView: AdressWebView) {
//            self.addressWebView = addressWebView
//        }
//    }
}

struct AddAddressView_Previews: PreviewProvider {
    static var previews: some View {
        AdressWebView(urlToLoad: "https://junghoon-p.github.io/Kakao-Postcode/")
    }
}
