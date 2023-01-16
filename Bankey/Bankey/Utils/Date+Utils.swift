//
//  Date+Utils.swift
//  Bankey
//
//  Created by Ali Butt on 16/01/2023.
//

import Foundation

extension Date {
    static var bankeyDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "CET")
        return formatter
    }
    
    var dayMonthYearString: String {
        let dateFormatter = Date.bankeyDateFormatter
        dateFormatter.dateFormat = "d MMM, yyyy"
        return dateFormatter.string(from: self)
    }
}
