//
//  DateFormat.swift
//  Game
//
//  Created by keva on 05/09/21.
//

import Foundation

func  dateFormat(dateStr: String) -> String {
    let date = dateStr
    let formatter1 = DateFormatter()
    formatter1.dateFormat = "yyyy-MM-dd"
    formatter1.locale = Locale(identifier: "en_US_POSIX")
    if let date2 = formatter1.date(from: date) {
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "dd MMMM yyyy"
        formatter2.locale = Locale(identifier: "en_US_POSIX")
        let dateString = formatter2.string(from: date2)
        return dateString
    } else {
        return "format not valid"
    }
}
