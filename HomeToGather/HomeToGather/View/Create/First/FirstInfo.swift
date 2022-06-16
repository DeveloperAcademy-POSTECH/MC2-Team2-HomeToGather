//
//  FirstInfo.swift
//  HomeToGather
//
//  Created by JungHoonPark on 2022/06/13.
//

import SwiftUI
import Combine

struct FirstInfo: View {
    
    @EnvironmentObject var partyData: PartyData
    @State private var date = Date()
    
    let color: Color = Color.borderColor
    let width: CGFloat = 0.5
    let size: CGFloat = UIScreen.main.bounds.width - 40
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ProgressBar(counter: 0.0)
        VStack(alignment: .leading) {
            TitleRow(text: "홈파티 소개")
                .padding(EdgeInsets(top: 65, leading: 20, bottom: 36, trailing: 20))
            
            VStack(alignment: .leading){
                SubTitleRow(text: "파티 이름")
                TextField("ex) 파티명을 적어주세요.", text: $partyData.title)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 20))
                    .onReceive(Just($partyData.title)) { _ in limitText(input: partyData.title, upper: 20)}
                Rectangle()
                    .fill(color)
                    .frame(height: width)
                    .edgesIgnoringSafeArea(.horizontal)
                HStack{
                    Spacer()
                    Text("\(partyData.title.count)/20")
                        .foregroundColor(.white)
                        .font(.notoSans(withStyle: .Light, size: 10))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                
                SubTitleRow(text: "소개")
                ZStack(alignment: .topLeading){
                    if partyData.description.isEmpty {
                        Text("ex) 모두 함께 보아요.")
                            .font(.notoSans(withStyle: .Light, size: 16))
                            .foregroundColor(.gray)
                            .lineSpacing(3) //줄 간격
                            .padding(.all)
                    }
                    TextEditor(text: $partyData.description)
                        .font(.notoSans(withStyle: .Light, size: 16))
                        .foregroundColor(.white)
                        .lineSpacing(3) //줄 간격
                        .padding(.all)
                    //                        .frame(width: 309)
                        .frame(minHeight: 90)
                        .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(color, lineWidth: 1))
                }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 30, trailing: 20))
            
            VStack(alignment: .leading){
                SubTitleRow(text: "날짜/시간")
                DatePicker(selection: $date, in: Date()...,
                           displayedComponents: [.date, .hourAndMinute], label: {Image(systemName: "calendar")})
                    .onChange(of: self.date) { date in
                        dateToString(date: date)
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                    .accentColor(Color.partyPurple)
                
                SubTitleRow(text: "장소")
                SearchAddressButton()
                TextField("ex) 상세주소를 입력해주세요.", text: $partyData.place)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 20))
                Rectangle()
                    .fill(color)
                    .frame(height: width)
                    .edgesIgnoringSafeArea(.horizontal)
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 53, trailing: 20))
        }
        .frame(width: size)
        .background(Color.cardBackgroundColor)
        .cornerRadius(4)
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    func limitText(input: String, upper: Int) {
        var text = input
        if text.count > upper {
            text = String(text.prefix(upper))
        }
    }
    
    func dateToString(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        partyData.date = dateFormatter.string(from: date)
    }
}


struct FirstInfo_Previews: PreviewProvider {
    static var previews: some View {
        FirstInfo()
    }
}
