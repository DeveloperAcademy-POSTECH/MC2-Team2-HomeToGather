//
//  ExampleButton.swift
//  HomeToGather
//
//  Created by KoJeongseok on 2022/06/18.
//

import SwiftUI

struct ExampleButton: View {
    
    @Binding var lists: [String]
    var examples: [String]
    
    
    var body: some View {
        Menu(content: {
            
            ForEach(examples, id: \.self) { examle in
                Button(action: {
                    lists.append(examle)
                }, label: {
                    Text(examle)
                })
            }
        }, label: {
            Image(systemName: "questionmark.circle")
        })
    }
}

//struct ExampleButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ExampleButton()
//    }
//}
