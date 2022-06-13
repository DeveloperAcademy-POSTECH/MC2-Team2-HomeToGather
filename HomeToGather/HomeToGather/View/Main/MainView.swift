import SwiftUI

struct MainView: View {
    @State var isTicketGesture = false
    @State var isTouched = false
    @State var showExpanedTicket = false
    @State var isTouchedTicket = false
    
    @State var showSettings = false
    @State var isSuccess = false
    
    // 나중에 네비게이션으로 여길 열어야 한다면, init()에 직접 변수를 넣어야 함
    // https://stackoverflow.com/questions/56910854/swiftui-views-with-a-custom-init
    init() {
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        
        NavigationView {
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
                            
                            NavigationLink {
                                InvitedListView()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.backgroundColor)
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
                                        .fill(Color.backgroundColor)
                                        .frame(width: 170, height: 60)
                                    
                                    Text("주최한 파티")
                                        .font(.notoSans(withStyle: .Bold, size: 17))
                                        .foregroundColor(.white)
                                }
                            }
                        }).offset(y: -15)
                    }
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}
