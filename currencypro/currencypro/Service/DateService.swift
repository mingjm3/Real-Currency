//
//  DateService.swift
//  currencypro
//
//  Created by Mingjun Ma on 11/21/22.
//

import Foundation

func getTodayDate() -> String {
    return formatDate(Date())
}



func formatDate(_ date: Date) -> String {
    var  formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
    return formatter.string(from: date)
}
