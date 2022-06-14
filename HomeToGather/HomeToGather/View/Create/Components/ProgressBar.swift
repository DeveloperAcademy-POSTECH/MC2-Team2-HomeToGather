//
//  ProgressBar.swift
//  HomeToGather
//
//  Created by KoJeongseok on 2022/06/14.
//

import SwiftUI
import CoreGraphics

struct ProgressBar: View {

    let size:CGFloat = UIScreen.main.bounds.width / 4
    var num: Int

    var body: some View {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: size / 4, height: size / 4)
                        .foregroundColor(.purple)
                    Text("1")
                        .foregroundColor(.white)
                        .bold()
                }

                Rectangle()
                    .frame(width: size, height: 5)
                    .foregroundColor(num > 1 ? .purple : .gray)
                    .padding(.leading, (size / 4) * -1 + (size / 6))
                    .padding(.trailing, (size / 4) * -1)

                ZStack {
                    Circle()
                        .frame(width: size / 4, height: size / 4)
                        .foregroundColor(num > 1 ? .purple : .gray)

                    Text("2")
                        .foregroundColor(.white)
                        .bold()
                }

                Rectangle()
                    .frame(width: size, height: 5)
                    .foregroundColor(num > 2 ? .purple : .gray)
                    .padding(.leading, (size / 4) * -1 + (size / 6))
                    .padding(.trailing, (size / 4) * -1)

                ZStack {
                    Circle()
                        .frame(width: size / 4, height: size / 4)
                        .foregroundColor(num > 2 ? .purple : .gray)
                    Text("3")
                        .foregroundColor(.white)
                        .bold()
                }
                Spacer()
            }

    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(num: 1)
    }
}
