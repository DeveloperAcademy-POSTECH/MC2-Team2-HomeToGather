
import Foundation

import SwiftUI

struct ColorPickerView: View {
    var colors = ["red","blue","green","yellow"]
    
    @State var selectedColor = "red"
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            
            VStack(spacing:0){
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        ForEach(colors,id:\.self) { color in
                            ColorView(color: color, selectedColor: $selectedColor)
                                .onTapGesture {
                                    selectedColor = color
                                }
                        }
                    }
                }).background(Color.backgroundColor)
                //
                ticketView(isTicketGesture: false, color: $selectedColor)
                    .background(Color.clear)
                
                Button {
                    
                } label: {
                    Text("만들기")
                        .font(.system(size: 18))
                }.frame(width: 350, height: 50, alignment: .center)
                    .background(Color.partyPurple)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                
                
            }
        }
        
        
    }
}
