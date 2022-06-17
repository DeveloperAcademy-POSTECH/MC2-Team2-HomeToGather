//
//  ContentView.swift
//  HomeToGather
//
//  Created by Doyun Park on 2022/06/09.
//

import SwiftUI
import Firebase
import AuthenticationServices

struct ContentView: View {
    @Environment(\.window) var window: UIWindow?
    
    @State private var appleLoginCoordinator: AppleAuthCoordinator?
    @State var isSuccess: Bool = Auth.auth().currentUser != nil ? false : true
    @State var isTouchedTicket: Bool = false
    
    // Deeplink Property
    let viewModel = ViewModel()
    let invitedViewModel = InvitedViewModel()
    let deeplinkManager = DeeplinkManager()
    @State var isEnteredWithLink: Bool = false
    @State var invitationID: String?
    
    @State private var isAddViewActive: Bool = false

    
    @State private var invitationCardData: Invitation?
    @State private var invitationCardViewToggle = false
    
    init() {
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        NavigationView {
            VStack {
                MainView(isTouchedTicket: $isTouchedTicket, shouldRefresh: invitationCardViewToggle)
                    .fullScreenCover(isPresented: $invitationCardViewToggle, content: {
                        VStack(spacing: 0) {
                            InvitedDetailView(invitationData: invitationCardData!)
                            
                            HStack(spacing: 0) {
                                Button(action: {
                                    invitationCardViewToggle.toggle()
                                }, label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(Color.cardBackgroundColor)
                                            .frame(height: 60)
                                        
                                        Text("불참")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .bold))
                                    }
                                })
                                .padding(.trailing, 5)
                                
                                Button(action: {
                                    // 애플 로그인 함수
                                    if isSuccess == true {
                                        appleLogin(isEnteredWithLink: self.isEnteredWithLink, invitationID: invitationID)
                                    } else {
                                        viewModel.getUserName(getUserUid())
                                        
                                        invitedViewModel.findInvitation(id: invitationID!) { invitation in
                                            print("DEBUG! : \(viewModel.userName)")
                                            invitedViewModel.acceptInvitation(getUserUid(), viewModel.userName, invitation!)
                                            print("DEBUG! : \(viewModel.userName) + 2")
                                            
                                            self.invitationCardViewToggle.toggle()
                                        }
                                        
                                    }
                                    // 참여한다고 데이터 전달하기
                                    
                                    
                                }, label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(Color.brandColor)
                                            .frame(height: 60)
                                        
                                        Text("참여")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .bold))
                                    }
                                })
                                .padding(.leading, 5)

                            }
                            .padding(20)
                        }
                    })
                    .fullScreenCover(isPresented: $isSuccess, content: {
                        VStack {
                            Spacer()
                            Image("LoginViewImage")
                                .resizable()
                                .aspectRatio(1.0, contentMode: .fit)
                                .padding(.horizontal, 17)
                                .padding(.bottom, 140)
                            QuickSignInWithApple()
                                .frame(maxWidth: .infinity)
                                .frame(height: 56, alignment: .center)
                                .onTapGesture {
                                    appleLogin(isEnteredWithLink: isEnteredWithLink, invitationID: invitationID ?? "")
                                }
                                .padding(.bottom, 60)
                                .padding(.horizontal, 17)
                        }
                        .background(Color.backgroundColor).ignoresSafeArea()
                    })
                
                    .onOpenURL { url in
                        let target = deeplinkManager.getDeeplinkTarget(url: url)
                        self.isEnteredWithLink = true
                        
                        switch target {
                        case .main:
                            print("onOpenURL_DEBUG : 메인 뷰로 들어가기")
                            
                        case .invitation(id: let id):
                            print("onOpenURL_DEBUG : 초대장 뷰로 들어가기")
                            viewModel.findInvitation(id: id, { data in
                                
                                if data != nil {
                                    self.invitationCardData = data!
                                    self.invitationID = id
                                    invitationCardViewToggle.toggle()
                                }
                            })
                        }
                    }
                
                // Deep Link로 들어왔을 때 초대장 뷰 띄우기
                NavigationLink(isActive: $invitationCardViewToggle) {
                    InvitationView(invitationData: self.invitationCardData ?? Invitation.dummyInvitation)
                } label: {
                    EmptyView()
                }
            }
//            .onAppear{
//                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") //forcing the rotation to portrait
//                
//                AppDelegate.orientationLock = .portrait
//            }.onDisappear{
//                AppDelegate.orientationLock = .all
//            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if isTouchedTicket {
                        Button {
                            withAnimation(.easeInOut(duration: 1.2)) {
                                isTouchedTicket.toggle()
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                        }
                    } else {
                        NavigationLink(destination: {
                            SettingView(isSuccess: $isSuccess)
                        }, label: {
                            Image(systemName: "gearshape.circle")
                                .foregroundColor(.white)
                        })
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing, content: {
                        NavigationLink(destination: FirstCreateView(), isActive: self.$isAddViewActive) {
                            Image(systemName: "plus.square")
                                .foregroundColor(.white)
                        }
                })
            }
            .navigationBarTitle("", displayMode: .inline)
        }
        .environment(\.rootPresentationMode, self.$isAddViewActive)
    }
    
    func appleLogin(isEnteredWithLink: Bool, invitationID: String?) {
        appleLoginCoordinator = AppleAuthCoordinator(window: window, isSuccess: $isSuccess, isEnteredWithLink: isEnteredWithLink, invitationID: invitationID, invitationCardViewToggle: $invitationCardViewToggle)
        appleLoginCoordinator?.startAppleLogin()
    }
    
}
