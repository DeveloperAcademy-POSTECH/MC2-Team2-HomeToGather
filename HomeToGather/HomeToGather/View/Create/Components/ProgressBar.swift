//
//  ProgressBar.swift
//  HomeToGather
//
//  Created by KoJeongseok on 2022/06/14.
//
import SwiftUI

struct ProgressBar: View {
    
    //counter: total값이 100인 프로그레스바의 시점지점
    @State var counter: Double
    @EnvironmentObject var partyData: PartyData
    
    let circleSize: CGFloat = 30
    
    
    var body: some View {
        HStack {
            ZStack {
                ProgressView(value: counter, total: 100)
                    .accentColor(.purple)
                    .scaleEffect(x: 1, y: 1.5, anchor: .center)
                    .onAppear {
                        
                        if partyData.isNextView {
                            if counter != 0.0 {
                                self.runCounter(counter: self.$counter, start: counter - 50.0, end: counter, speed: 0.02)
                            }
                        } else {
                            // 뒤로가기
                                self.backRunCounter(counter: self.$counter, end: counter, start: counter + 50.0, speed: 0.02)
                            
                        }
                        
                        partyData.isNextView = true
                        
                    }
                
                HStack {
                    
                    ZStack {
                        Circle()
                            .frame(width: circleSize, height: circleSize)
                            .foregroundColor(.partyPurple)
                        Text(String("1"))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .frame(width: circleSize, height: circleSize)
                            .foregroundColor($counter.wrappedValue >= 40.0 ? .partyPurple : .placeholderColor)
                        Text(String("2"))
                            .foregroundColor(.white)
                        
                    }
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .frame(width: circleSize, height: circleSize)
                            .foregroundColor($counter.wrappedValue >= 90.0 ? .partyPurple : .placeholderColor)
                        Text(String("3"))
                            .foregroundColor(.white)
                    }
                }
            }
            .frame(width: (UIScreen.main.bounds.width - 40) * 0.6)
//            .padding(EdgeInsets(top: 47, leading: 20, bottom: 17, trailing: 20))
            .padding(.horizontal, 20)
            .padding(.top, 5)
            .padding(.bottom, 10)
            
            Spacer()
        }
            
    }
    func runCounter(counter: Binding<Double>, start: Double, end: Double, speed: Double) {
        counter.wrappedValue = start
        
        Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { timer in
            counter.wrappedValue += 1.0
            if counter.wrappedValue == end {
                timer.invalidate()
                
            }
        }
    }
    
    func backRunCounter(counter: Binding<Double>, end: Double, start: Double, speed: Double) {
        counter.wrappedValue = start
        
        Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { timer in
            counter.wrappedValue -= 1.0
            if counter.wrappedValue == end {
                timer.invalidate()
                
            }
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(counter: 50.0)
    }
}
