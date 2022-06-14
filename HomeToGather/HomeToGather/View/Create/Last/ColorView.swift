import SwiftUI

struct ColorView: View {
    @State var color: String
    @Binding var selectedColor: String
    
    var body: some View {
        ZStack {
            
            Circle()
                .fill(Color.getColor(color: color))
                .frame(width: 50, height: 50)
            
            if selectedColor == color {
                Image(systemName:"checkmark")
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
            }
            
        }
    }
}
