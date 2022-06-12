import SwiftUI

struct MainView: View {
    @State var isTicketGesture = false
    @State var isTouched = false
    @State var showExpanedTicket = false
    @State var isTouchedTicket = false
    
    @State var showSettings = false
    @State var isSuccess = false
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
                
            }
            
            
        }
    }
}
