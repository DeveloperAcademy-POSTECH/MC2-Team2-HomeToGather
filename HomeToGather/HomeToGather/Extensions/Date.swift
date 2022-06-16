//
//  Date.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/16.
//

import Foundation

extension Date {
    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        return dateFormatter.string(from: date)
    }
}
