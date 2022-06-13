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
                            }
                        }
                    }
                }
                .padding(.top, 28)
                .padding(.bottom, 22)
                
                if feedbackContents != nil {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(maxWidth: screenWidth, maxHeight: 0.5)
                
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(feedbackContents!, id: \.self) { feedback in
                            HStack(spacing: 0) {
                                Text("· ")
                                Text(feedback)
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

struct FeedbackCardView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackCardView(title: "규칙", contents: ["1번", "2번"], feedbackContents: ["1번 피드백", "2번 피드백"])
    }
}
