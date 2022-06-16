//
//  Date.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/16.
//

import Foundation

extension Date {
    func dateCompare(fromDate: Date) -> ComparisonResult {
        return self.compare(fromDate)
    }
}

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
}
