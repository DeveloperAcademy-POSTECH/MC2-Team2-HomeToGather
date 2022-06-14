//
//  FirstInfo.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/13.
//

import SwiftUI
import Combine

struct FirstInfo: View {
    
    //    @ObservedObject var partyData = PartyData
    @EnvironmentObject var partyData: PartyData
    
    @State var partyName = ""
    
    @State var detailAddress = ""
    
    let textLimit = 20
    let color: Color = Color.borderColor
    let width: CGFloat = 0.5
    let size: CGFloat = UIScreen.main.bounds.width - 40
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            TitleRow(text: "홈파티 소개")
                .padding(EdgeInsets(top: 65, leading: 20, bottom: 50, trailing: 36))
            VStack(alignment: .leading){
                SubTitleRow(text: "파티 이름")
                TextField("ex) 파티명을 적어주세요.", text: $partyData.title)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 7, trailing: 6))
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
                SubTitleRow(text: "소개")
                ZStack(alignment: .leading){
                    if partyData.description == "" {
                        Text("파티를 소개해보세요.")
                            .font(.notoSans(withStyle: .Light, size: 16))
                            .foregroundColor(.gray)
                            .padding(.all)
                    }
                    
                    TextEditor(text: $partyData.description)
                        .padding()
                        .foregroundColor(.white)
//                        .background(Color.cardBackgroundColor)
                        .background(Color.white)
                        .font(.notoSans(withStyle: .Light, size: 16))
                        .lineSpacing(3) //줄 간격
                        .frame(width: 309, height: 85)
//                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
//                        .border(color, width: 1)
                    
                }
            }
            .padding(20)
            VStack(alignment: .leading){
                SubTitleRow(text: "날짜/시간")
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/
                           , label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                SubTitleRow(text: "장소")
                SearchAddressButton()
                TextField("ex) 상세주소를 입력해주세요.", text: $detailAddress)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                Rectangle()
                    .fill(color)
                    .frame(height: width)
                    .edgesIgnoringSafeArea(.horizontal)
            }
            .padding(20)
        }
        .frame(width: size)
        .background(Color.cardBackgroundColor)
        .cornerRadius(4)
//        .padding(EdgeInsets(top: 65, leading: 20, bottom: 50, trailing: 20))
    }
    func limitText(_ upper: Int) {
        if partyName.count > upper {
            partyName = String(partyName.prefix(upper))
        }
    }
}


struct FirstInfo_Previews: PreviewProvider {
    static var previews: some View {
        FirstInfo()
    }
}
