import SwiftUI

struct MainView: View {
    @State var isTicketGesture = false
    @State var isTouched = false
    @State var showExpanedTicket = false
    @Binding var isTouchedTicket: Bool
    
    @State var showSettings = false
    @State var isSuccess = false
    
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
                    ticketView(isTicketGesture: isTicketGesture)
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
            }
            .padding(.top, 100)
            .preferredColorScheme(.dark)
        }
    }
}
