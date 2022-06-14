//
//  CostView.swift
//  HomeToGather
//
//  Created by KoJeongseok on 2022/06/14.
//
import SwiftUI

struct CostView: View {


    @EnvironmentObject var partyData: PartyData
    @FocusState private var focusState: Bool
    @State var placeholder: String = "ex) 30,000(원)"
    @State var isCost: Bool = false
    @Binding var cost: String


    var body: some View {

        VStack(alignment: .leading, spacing: 20) {
            Text("비용 분배 방법을 선택해주세요.")
            HStack {
                if isCost {
                    Image(systemName: "circle")
                    Text("없음")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                } else {
                    Image(systemName: "circle.inset.filled")
                    Text("없음")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                }
            }
            .onTapGesture {
                isCost = false
                focusState = false
                cost = ""
                print(isCost)
            }

            HStack {
                Image(systemName: isCost ? "circle.inset.filled" : "circle")

                TextField("", text: $cost)
                    .focused($focusState)
                    .placeholder(when: cost.isEmpty) {
                        Text(isCost ? placeholder : "분배")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 16))
                            .onAppear(perform: {
                                print("textField on Appear")
                            })

                    }
                    .textFieldStyle(.plain)
                    .keyboardType(.numberPad)

            }
            .onTapGesture {
                isCost = true
//                partyData.isCostValue = true
                focusState = true
                cost = ""
//                print(isCost)
            }
            Divider()
                .padding(.top, -10)

        }
    }
}
