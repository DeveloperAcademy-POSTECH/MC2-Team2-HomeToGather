//
//  AddListView.swift
//  HomeToGatherEX
//
//  Created by KoJeongseok on 2022/06/10.
//partyData.ruleLists.append(partyData.rule)

import SwiftUI

struct AddListView: View {
    
    @EnvironmentObject var partyData: PartyData
    
    @Binding var lists: [String]
    @State var item: String = ""
    //    @Binding var item: String
    var text: String
    var placeholder: String
    let size: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            HStack {
                Text(text)
                    .font(.system(size: 16))
                
                Spacer()
            }
            
            ForEach(0..<lists.count, id: \.self) { num in
                ListView(lists: $lists, item: $item, text: lists[num] , index: num)
                    .padding(.top, 20)
                
            }
            VStack {
                
                HStack {
                    TextField("", text: $item)
                        .placeholder(when: item.isEmpty) {
                            Text(placeholder)
                                .foregroundColor(Color.gray)
                                .font(.system(size: 16))
                            
                        }
                        .onSubmit {
                            if item != ""{
                                lists.append(item)
                                item = ""
                                print(lists)
                            }
                            
                        }
                    if item != "" {
                        Button(action: {
                            lists.append(item)
                            item = ""
                            print(lists)
                        }, label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.white)
                            
                        })
                    }
                    
                }
                
                Divider()
            }
            .padding(.top, 20)
        }
    }
}


