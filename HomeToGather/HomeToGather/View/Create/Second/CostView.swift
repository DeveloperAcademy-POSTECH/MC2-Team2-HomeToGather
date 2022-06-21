//
//  CostView.swift
//  HomeToGather
//
//  Created by KoJeongseok on 2022/06/14.
//
import SwiftUI
import Combine

struct CostView: View {
    
    
    @EnvironmentObject var partyData: PartyData
    @FocusState private var focusState: Bool
    @State var placeholder: String = "ex) 30,000(원)"
    @State var isCost: Bool = false
    @Binding var cost: String
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            Text("비용 분배 방법을 선택해주세요.")
                .foregroundColor(.white)
                .font(.notoSans(withStyle: .Light, size: 16))
            HStack {
                Image(systemName: isCost ? "circle" : "circle.inset.filled")
                Text("없음")
                    .font(.notoSans(withStyle: .Light, size: 16))
                    .foregroundColor(isCost ? .placeholderColor : .white)
                
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 20))
            .onTapGesture {
                isCost = false
                focusState = false
                cost = ""
                print(isCost)
            }
            
            HStack {
                Image(systemName: isCost ? "circle.inset.filled" : "circle")
                
                TextField(isCost ? placeholder : "1/n", text: $cost)
                    .focused($focusState)
                    .foregroundColor(.white)
                    .font(.notoSans(withStyle: .Light, size: 16))
                    .textFieldStyle(.plain)
                    .keyboardType(.numberPad)
                    .onReceive(Just($cost)) { _ in limitText(10) }

                
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: -3, trailing: 20))
            .onTapGesture {
                isCost = true
                focusState = true
                cost = ""
            }
            Divider()
            
            if isCost {
                HStack {
                    Spacer()
                    // 값 적용시에 "원", (,) 추가되어 텍스트 길이가 의도한 길이보다 길어짐
                    Text("\(cost.count)/10")
                        .foregroundColor(.white)
                        .font(.system(size: 10, weight: .light))
                }
            }
            
            
            
        }
    }
    func limitText(_ upper: Int) {
        if cost.count > upper {
            cost = String(cost.prefix(upper))
        }
    }
}
