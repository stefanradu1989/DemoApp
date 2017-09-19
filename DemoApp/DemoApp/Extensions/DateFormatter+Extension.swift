//
//  DateFormatter+Extension.swift
//  DemoApp
//
//  Created by Radu Stefan on 18/09/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import Foundation


extension DateFormatter {
    
    static let datePersonFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }()
    
    static func getAgeFromDob(dob: String) -> Int {
        let dateFromString = datePersonFormatter.date(from: dob)
        
        let year = Calendar.current.component(.year, from: dateFromString!)
        let month = Calendar.current.component(.month, from: dateFromString!)
        let day = Calendar.current.component(.day, from: dateFromString!)
    
        return Date().calculateAgeFromDob(year: year, month: month, day: day)
    }
}
