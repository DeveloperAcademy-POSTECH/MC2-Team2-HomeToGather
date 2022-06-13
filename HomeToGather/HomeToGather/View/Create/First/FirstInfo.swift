//
//  FirstInfo.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/13.
//

import SwiftUI
import Combine

struct InfoView: View {
    
    //    @ObservedObject var partyData = PartyData
    
    @State var partyName = ""
    
    @State var detailAddress = ""
    
    let textLimit = 20
    let color: Color = .gray
    let width: CGFloat = 0.5
    let size: CGFloat = UIScreen.main.bounds.width - 40
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            TitleRow(text: "홈파티 소개")
                .padding(20)
            VStack(alignment: .leading){
                SubTitleRow(text: "파티 이름")
                TextField("ex) 파티명을 적어주세요.", text: $partyName)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    .onReceive(Just($partyName)) { _ in limitText(textLimit) }
                Rectangle()
                    .fill(color)
                    .frame(height: width)
                    .edgesIgnoringSafeArea(.horizontal)
                HStack{
                    Spacer()
                    Text("\(partyName.count)/20")
                        .foregroundColor(.white)
                        .font(.system(size: 10       , weight: .light))
                }
                SubTitleRow(text: "날짜/시간")
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/
                           , label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                SubTitleRow(text: "장소")
                SearchButtonView()
                TextField("ex) 상세주소를 입력해주세요.", text: $detailAddress)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                Rectangle()
                    .fill(color)
                    .frame(height: width)
                    .edgesIgnoringSafeArea(.horizontal)
            }.padding(20)
        }
        .frame(width: size)
        .background(Color(.gray))
        .cornerRadius(4)
        .padding(20)
    }
    func limitText(_ upper: Int) {
        if partyName.count > upper {
            partyName = String(partyName.prefix(upper))
        }
    }
}
