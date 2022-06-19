//
//  CardView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/11.
//

import SwiftUI

func getTextView(title: String, contents: Invitation) -> some View {
    switch title {
    case "규칙":
        struct tmpView: View {
            var contents: Invitation
            
            var body: some View {
                
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(contents.rule, id: \.self) { content in
                        HStack(spacing: 0) {
                            Text("· ")
                            Text(content)
                                .font(content.guessLanguage() == "한국어" ? .notoSans(withStyle: .Light, size: 14) : .montserrat(withStyle: .Light, size: 14))
                        }
                    }
                }
            }
        }
        return AnyView(tmpView(contents: contents))
    case "메뉴":
        struct tmpView: View {
            var contents: Invitation
            
            var body: some View {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(contents.food, id: \.self) { content in
                        HStack(spacing: 0) {
                            Text("· ")
                            Text(content)
                                .font(content.guessLanguage() == "한국어" ? .notoSans(withStyle: .Light, size: 14) : .montserrat(withStyle: .Light, size: 14))
                        }
                    }
                }
            }
        }
        return AnyView(tmpView(contents: contents))
    default:
        struct tmpView: View {
            var body: some View {
                Text("Error")
            }
        }
        return AnyView(tmpView())
    }
}

struct CardView: View {
    var title: String
    var contents: Invitation
    var shouldFeedbackPresented: Bool
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
                            .font(.notoSans(withStyle: .Medium, size: 24))
                    }
                    Spacer()
                    Button(action: {
                        if shouldFeedbackPresented {
                            isModalPresent.toggle()
                        }
                    }, label: {
                        Image(systemName: "paperplane.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    })
                }
                .padding(.top, 12)
                
                VStack(alignment: .leading, spacing: 0) {
                    getTextView(title: title, contents: contents)
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
                        
                        FocusView(isModalPresent: $isModalPresent, title: title, contents: contents)
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
    @State var viewModel = ViewModel()
    
    var title: String
    var contents: Invitation
    @State var correctedInvitation = Invitation(id: "", uid: "", organizerName: "", title: "", date: "", place: "", description: "", rule: [""], cost: "", food: [""], etc: [""], ruleFeedback: [""], foodFeedback: [""], color: "")
    
    init(isModalPresent: Binding<Bool>, title: String, contents: Invitation) {
        self._isModalPresent = isModalPresent
        self.title = title
        self.contents = contents
    }
    
    var body: some View {
        HStack {
            TextField("피드백을 입력해주세요.", text: $feedback)
                .foregroundColor(.white)
                .focused($isFocused)
            
            Spacer()
            
            Button {
                correctedInvitation = Invitation(id: contents.id, uid: contents.uid, organizerName: contents.organizerName, participantName: contents.participantName, participantUid: contents.participantUid, title: contents.title, date: contents.date, place: contents.place, description: contents.description, rule: contents.rule, cost: contents.cost, food: contents.food, etc: contents.etc, ruleFeedback: contents.ruleFeedback, foodFeedback: contents.foodFeedback, color: contents.color)
                
                switch title {
                case "규칙":
                    correctedInvitation.ruleFeedback.append(feedback)
                    print(correctedInvitation)
                case "메뉴":
                    correctedInvitation.foodFeedback.append(feedback)
                    print(correctedInvitation)
                default:
                    print("Error")
                }
                viewModel.correctionInvitation(correctedInvitation, correctedInvitation.id)
                
                isModalPresent = false
            } label: {
                Image(systemName: "paperplane.circle.fill")
            }
            .foregroundColor(.white)
        }
        .padding(20)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.isFocused = true
            }
        }
    }
}
