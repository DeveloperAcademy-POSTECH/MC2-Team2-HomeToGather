import SwiftUI

struct MainView: View {
    @State var isTicketGesture = false
    @State var isTouched = false
    @State var showExpanedTicket = false
    @State var isTouchedTicket = false
    
    @State var showSettings = false
    @State var isSuccess = false
    
    let viewModel: ViewModel = ViewModel()
    
    // Deeplink Property
    let deeplinkManager = DeeplinkManager()
    @State private var invitationCardData: Invitation? = nil
    @State private var invitationCardViewToggle: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
                    
                    if isTouchedTicket {
                        VStack {
                            expanedTicketView(flag: $isTouchedTicket)
                                .offset(y: -50)
                                .background(Color.white)
                                .toolbar {
                                    ToolbarItem(placement: .navigationBarLeading) {
                                        Button {
                                            withAnimation(.easeInOut(duration: 1.2)) {
                                                isTouchedTicket.toggle()
                                            }
                                        } label: {
                                            Image(systemName: "xmark")
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                        }
                        
                    } else {
                        ticketView(isTicketGesture: isTicketGesture)
                            .offset(y: -100)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 1.2)) {
                                    isTouchedTicket.toggle()
                                }
                                
                            }
                        
                        HStack(alignment: .center, spacing: 10, content: {
                            Button {
                                //
                            } label: {
                                Text("초대한 파티")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 17))
                            }.frame(width: 170, height: 60)
                                .background(Color.gray)
                                .cornerRadius(4)
                            Button {
                                //
                            } label: {
                                Text("초대된 파티")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 17))
                            }.frame(width: 170, height: 60)
                                .background(Color.gray)
                                .cornerRadius(4)
                        }).offset(y: -15)
                    }
                }

                // Deep Link로 들어왔을 때 초대장 뷰 띄우기
                // 뷰 수정 필요
                NavigationLink(isActive: $invitationCardViewToggle) {
                    DEBUG_InvitationCardView(invitationCardData: self.invitationCardData ?? nil)
                } label: {
                    EmptyView()
                }

            }
            .onOpenURL { url in
                let deeplink = deeplinkManager.manage(url: url)
                let target = deeplink
                
                print("onOpenURL_DEBUG : URL로 들어옴")
                
                switch target {
                case .main:
                    print("onOpenURL_DEBUG : 메인 뷰로 들어가기")
                    
                case .invitation(id: let id):
                    print("onOpenURL_DEBUG : 초대장 뷰로 들어가기")
                    viewModel.findInvitation(id: id, { data in
                        
                        if data != nil {
                            self.invitationCardData = data!
                            invitationCardViewToggle.toggle()
                        }
                    })
                }
            }
        }
    }
}
