//
//  FeedbackCardView.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/12.
//

import SwiftUI

struct FeedbackCardView: View {
    var title: String
    var contents: [String]?
    var feedbackContents: [String]?
    
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.cardBackgroundColor)
            
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.brandColor)
                        .frame(width: 50, height: 15)
                    
                    Text(title)
                        .font(.system(size: 24, weight: .bold))
                }
                .padding(.top, 12)
                
                VStack(alignment: .leading, spacing: 0) {
                    if contents != nil {
                        ForEach(contents!, id: \.self) { content in
                            HStack(spacing: 0) {
                                Text("· ")
                                Text(content)
                                    .font(content.guessLanguage() == "한국어" ? .notoSans(withStyle: .Light, size: 14) : .montserrat(withStyle: .Light, size: 14))
                            }
                        }
                    }
                }
                .padding(.top, 28)
                .padding(.bottom, 22)
                
                if feedbackContents != [""] {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(maxWidth: screenWidth, maxHeight: 0.5)
                
                    VStack(alignment: .leading, spacing: 0) {
                        if let feedback = feedbackContents! {
                            ForEach(feedback, id: \.self) { feedback in
                                if feedback != "" {
                                    HStack(spacing: 0) {
                                        Text("· ")
                                        Text(feedback)
                                            .font(feedback.guessLanguage() == "한국어" ? .notoSans(withStyle: .Medium, size: 12) : .montserrat(withStyle: .Medium, size: 12))
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 22)
                    .padding(.bottom, 17)
                }
            }
            .padding(20)
        }
        .frame(maxWidth: screenWidth)
        .padding(.top, 22)
    }
}
