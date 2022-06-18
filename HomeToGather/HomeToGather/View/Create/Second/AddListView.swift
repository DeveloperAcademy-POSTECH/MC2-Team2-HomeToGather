//
//  AddListView.swift
//  HomeToGather
//
//  Created by KoJeongseok on 2022/06/14.
//
import SwiftUI
import Combine

struct AddListView: View {

    @EnvironmentObject var partyData: PartyData
    @Binding var lists: [String]
    @Binding var item: String
    var examples: [String]
    var text: String
    var placeholder: String
    let size: CGFloat = UIScreen.main.bounds.width
    //        .font(.notoSans(withStyle: .Bold, size: 28))
    
    
    var body: some View {
        VStack {
            HStack {
                Text(text)
                    .font(.notoSans(withStyle: .Light, size: 16))
                    .foregroundColor(.white)

                Spacer()
                ExampleButton(lists: $lists, examples: examples)
            }
            .padding(.bottom, 5)

            ForEach(0..<lists.count, id: \.self) { num in
                ListView(lists: $lists, item: $item, text: lists[num] , index: num)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))

            }
            VStack {

                HStack {
                    TextField(placeholder, text: $item)
                        .font(.notoSans(withStyle: .Light, size: 16))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 20))
                        .onSubmit {
                            if item != ""{
                                lists.append(item)
                                item = ""
                                print(lists)
                            }

                        }
                        .onReceive(Just($item)) { _ in limitText(50) }
                    
                    
                    
                    if item != "" {
                        Button(action: {
//                            hideKeyboard()
                            lists.append(item)
                            item = ""
                            print(lists)
                        }, label: {
                            Image(systemName: "plus.square")
                                .foregroundColor(.white)

                        })
                        
                    }

                }

                Divider()
                HStack{
                    Spacer()
                    Text("\(item.count)/50")
                        .foregroundColor(.white)
                        .font(.system(size: 10, weight: .light))
                }
                    
            }
        }

    }
    func limitText(_ upper: Int) {
        if item.count > upper {
            item = String(item.prefix(upper))
        }
    }
}

