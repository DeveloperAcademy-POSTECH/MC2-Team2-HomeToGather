import SwiftUI
import CryptoKit
import AuthenticationServices
import FirebaseAuth
import Firebase
import FirebaseFirestore

class AppleAuthCoordinator: NSObject {
    var currentNonce: String?
    let window: UIWindow?
    @Binding var isSuccess: Bool
    @Binding var invitationCardViewToggle: Bool
    
    var isEnteredWithLink: Bool
    var invitationID: String?

    
    let db = Firestore.firestore()
    
    init(window: UIWindow?, isSuccess: Binding<Bool>, isEnteredWithLink: Bool, invitationID: String?, invitationCardViewToggle: Binding<Bool>) {
        self.window = window
        self._isSuccess = isSuccess
        self.isEnteredWithLink = isEnteredWithLink
        self.invitationID = invitationID
        self._invitationCardViewToggle = invitationCardViewToggle
    }
    
    // Apple의 응답을 처리하는 대리자 클래스와 nonce의 SHA256 해시를 요청에 포함하는 것으로 Apple의 로그인 과정을 시작
    func startAppleLogin() {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    // 로그인 요청과 함께 nonce의 sha256 해시를 전송하면 Apple에서 원래의 값으로 응답한다.
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    // 로그인 시 재전송 공격 방지를 위한 임의의 nonce를 생성
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
}

// ASAuthorizationControllerDelegate를 구현하여 Apple의 응답을 처리합니다. 로그인에 성공했으면 해시되지 않은 nonce가 포함된 Apple의 응답에서 ID 토큰을 사용하여 Firebase에 인증
extension AppleAuthCoordinator: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            
            let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                      idToken: idTokenString,
                                                      rawNonce: nonce)
            
            //Firebase 작업
            firebaseSigning(appleIDCredential: appleIDCredential, credential: credential) { data in
                if self.isEnteredWithLink {
                    
                    let viewModel = InvitedViewModel()
                    
                    viewModel.getUserName(data) { userName in
                        
                        print("\(data), \(userName), \(self.invitationID)")
                        viewModel.findInvitation(id: self.invitationID!) { invitation in
                            viewModel.acceptInvitation(data, userName, invitation!)
                        }
                        
                        self.invitationCardViewToggle.toggle()
                    }
                }
            }
        }
    }
    
    func firebaseSigning(appleIDCredential: ASAuthorizationAppleIDCredential ,credential: OAuthCredential, _ completion: @escaping (_ data: String) -> Void) {
        
        print("DEBUG_ dispatch")
        let g = DispatchGroup()
        g.enter()
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if error != nil {
                print("DEBUG_ error")
                print(error!.localizedDescription)
                g.leave()
                return
            }
            if appleIDCredential.fullName?.familyName != nil && Auth.auth().currentUser?.uid != nil {
                self.db.collection("user").document(getUserUid()).setData(["uid": getUserUid(), "name":"\(appleIDCredential.fullName!.familyName!)"+"\(appleIDCredential.fullName!.givenName!)"])
            }
            
            print("DEBUG_ \(getUserUid())")
            g.leave()
        }
        
        if let _ = appleIDCredential.email {
            print("111111 ================= 첫 로그인")
            isSuccess = false
        } else {
            print("222222 ================== 로그인 했었음")
            isSuccess = false
        }
        
        g.notify(queue:.main) {
            completion(getUserUid())
        }
    }
}
//\(Auth.auth().currentUser!.uid)
//"name": "\(appleIDCredential.fullName!.familyName)"+"\(appleIDCredential.fullName!.givenName)"
extension AppleAuthCoordinator: ASAuthorizationControllerPresentationContextProviding {
    public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        window!
    }
}

struct WindowKey: EnvironmentKey {
    struct Value {
        weak var value: UIWindow?
    }
    
    static let defaultValue: Value = .init(value: nil)
}

extension EnvironmentValues {
    var window: UIWindow? {
        get {
            return self[WindowKey.self].value
        }
        set {
            self[WindowKey.self] = .init(value: newValue)
        }
    }
}

struct QuickSignInWithApple: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    
    func makeUIView(context: Context) -> UIViewType {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .white)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
