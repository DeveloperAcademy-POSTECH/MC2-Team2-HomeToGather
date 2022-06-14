import SwiftUI

struct MainView: View {
    @State var isTicketGesture = false
    @State var isTouched = false
    @State var showExpanedTicket = false
    @Binding var isTouchedTicket: Bool
    
    @State var showSettings = false
    @State var isSuccess = false
    @State var defaultColor = "red"
    let viewModel: ViewModel = ViewModel()
    
    // Deeplink Property
    let deeplinkManager = DeeplinkManager()
    @State private var invitationCardData: Invitation? = nil
    @State private var invitationCardViewToggle: Bool = false

    var body: some View {
        ZStack {
            Color.backgroundColor
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
                                        withAnimation(.easeInOut(duration:  0.8)) {
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
                    ticketView(isTicketGesture: isTicketGesture, color: invitationCardData == nil ? defaultColor : invitationCardData!.color)
                        .offset(y: -100)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.8)) {
                                isTouchedTicket.toggle()
                            }
                            
                        }
                    
                    HStack(alignment: .center, spacing: 10, content: {
                        
                        NavigationLink {
                            InvitedListView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.buttonColor)
                                    .frame(width: 170, height: 60)
                                
                                Text("초대된 파티")
                                    .font(.notoSans(withStyle: .Bold, size: 17))
                                    .foregroundColor(.white)
                            }
                        }
                        
                        NavigationLink {
                            HostedListView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.buttonColor)
                                    .frame(width: 170, height: 60)
                                
                                Text("주최한 파티")
                                    .font(.notoSans(withStyle: .Bold, size: 17))
                                    .foregroundColor(.white)
                            }
                        }
                    })
                }
                
                // Deep Link로 들어왔을 때 초대장 뷰 띄우기
                // 뷰 수정 필요
                NavigationLink(isActive: $invitationCardViewToggle) {
                    DEBUG_InvitationCardView(invitationCardData: self.invitationCardData ?? nil)
                } label: {
                    EmptyView()
                }
            }
            .padding(.top, 100)
            .preferredColorScheme(.dark)
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
