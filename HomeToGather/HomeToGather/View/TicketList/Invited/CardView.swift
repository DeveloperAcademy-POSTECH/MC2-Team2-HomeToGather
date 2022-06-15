//
//  CardView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/11.
//

import SwiftUI

struct CardView: View {
    var title: String
    var contents: [String]?
    @State var isModalPresent: Bool = false
    @State var feedback: String = ""
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let opacity0: Double = 0.00001
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.cardBackgroundColor)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    ZStack(alignment: .bottomLeading) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.brandColor)
                            .frame(width: 50, height: 15)
                        
                        Text(title)
                            .font(.system(size: 24, weight: .bold))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isModalPresent.toggle()
                    }, label: {
                        Image(systemName: "paperplane.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    })
                }
                .padding(.top, 12)
                
                VStack(alignment: .leading, spacing: 0) {
                    if contents != nil {
                        ForEach(contents!, id: \.self) { content in
                            HStack(spacing: 0) {
                                Text("· ")
                                Text(content)
                            }
                        }
                    }
                }
                .padding(.top, 28)
                .padding(.bottom, 23)
            }
            .padding(20)
        }
        .fullScreenCover(isPresented: $isModalPresent) {
            ZStack(alignment: .bottom) {
                Color.black
                    .opacity(0.6)
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(.black)
                        .opacity(opacity0)
                        .onTapGesture {
                            isModalPresent.toggle()
                        }
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: screenWidth)
                            .strokeBorder()
                            .frame(maxWidth: screenWidth, maxHeight: 50)
                        FocusView(isModalPresent: $isModalPresent)
                    }
                    .padding(20)
                }
            }
            .background(BackgroundClearView().ignoresSafeArea())
            .preferredColorScheme(.dark)
        }
        .frame(maxWidth: screenWidth)
        .padding(.top, 22)
    }
}

struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView()
        
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct FocusView: View {
    @FocusState private var isFocused: Bool
    @State private var feedback: String = ""
    @Binding var isModalPresent: Bool
    
    var body: some View {
        
        HStack {
            TextField("피드백을 입력해주세요.", text: $feedback)
                .foregroundColor(.white)
                .focused($isFocused)
            
            Spacer()
            
            Button {
                isModalPresent = false
            } label: {
                Image(systemName: "paperplane.circle.fill")
            }
            .foregroundColor(.white)
        }
        .padding(20)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                self.isFocused = true
            }
        }
    }
}
